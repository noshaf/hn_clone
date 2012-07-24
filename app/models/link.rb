class Link < ActiveRecord::Base
  attr_accessible :title, :url
  validates_presence_of :url, :title
  before_save :clean_url

  def clean_url
    return self.url if self.url =~ %r{^http://}
    self.url = "http://#{self.url}" 
  end
end
