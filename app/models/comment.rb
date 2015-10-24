class Comment < ActiveRecord::Base
  validates :name, :content, :presence => true
  belongs_to :post
  belongs_to :user 
end
