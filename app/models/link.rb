class Link < ActiveRecord::Base
  attr_accessible :title, :url, :user_id
  validates_presence_of :url, :title, :user_id
  validate :editable
  before_save :clean_url
  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum
  
  def editable 
    if self.created_at && Time.now - self.created_at > 900
      errors.add(:base, "You cannot edit links more than 15 minutes after posting.")
    end
  end
  
  def editable?
    self.created_at && Time.now - self.created_at < 900
  end
  
  def self.order
    # links = Link.find_with_reputation(:votes, :all, order: 'votes desc')
    Link.all.sort do |a,b|
       b.rank <=> a.rank
    end
  end
  
  def maturity
    (Time.now - self.created_at) / 3600
  end
  
  def votes
    self.reputation_value_for(:votes).to_i
  end
  
  def rank
    self.votes / self.maturity ** 1.8
  end
  
  private 
  
  def clean_url
    return self.url if self.url =~ %r{^http://}
    self.url = "http://#{self.url}" 
  end
  
end
