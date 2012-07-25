class Link < ActiveRecord::Base
  attr_accessible :title, :url, :user_id
  validates_presence_of :url, :title, :user_id
  validate :editable
  before_save :clean_url
  belongs_to :user

  def clean_url
    return self.url if self.url =~ %r{^http://}
    self.url = "http://#{self.url}" 
  end
  
  def editable 
   raise "YOU'RE TOO SLOW" if self.created_at && Time.now - self.created_at > 900
  end
end
