class Comment < ActiveRecord::Base
  attr_accessible :body
  belongs_to :commentable, polymorphic: true
  belongs_to :user 
  has_many :comments, as: :commentable
  validates_presence_of :body

  
end
