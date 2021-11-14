class Comment < ApplicationRecord
  include UserAssociable
  
  has_rich_text :content
  
  validates :name, :content, presence: true
end
