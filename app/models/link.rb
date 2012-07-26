class Link < ActiveRecord::Base
  attr_accessible :title, :url, :user_id
  validates_presence_of :url, :title, :user_id
  validate :editable
  before_save :clean_url
  belongs_to :user
  has_reputation :votes, source: :user, aggregated_by: :sum

  def clean_url
    return self.url if self.url =~ %r{^http://}
    self.url = "http://#{self.url}" 
  end
  
  def editable 
    if self.created_at && Time.now - self.created_at > 900
      errors.add(:base, "You cannot edit links more than 15 minutes after posting.")
    end
  end
  
  def editable?
    self.created_at && Time.now - self.created_at < 900
  end
  
end
