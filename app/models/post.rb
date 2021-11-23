class Post < ApplicationRecord
  include UserAssociable
  
  has_rich_text :content
  
  has_many :comments
  
  validates :title, :content, presence: true
end
