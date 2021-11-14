class Comment < ApplicationRecord
  include UserAssociable
  
  has_rich_text :content
  
  validates :content, presence: true
end
