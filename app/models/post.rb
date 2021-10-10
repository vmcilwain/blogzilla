class Post < ApplicationRecord
  include UserAssociable
  
  has_rich_text :content
  
  validates :title, :content, presence: true
end
