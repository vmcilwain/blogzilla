class Comment < ApplicationRecord
  include UserAssociable
  
  has_rich_text :content
  
  belongs_to :post

  validates :name, :content, presence: true
end
