class Link < ActiveRecord::Base
  attr_accessible :title, :url
  
  def clean_url
    # return self.url if self.url =~ %r{^http://}
    
    # @url = "http://#{@url}" 
    # @url = "http://test.org"
  end
  
end
