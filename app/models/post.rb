class Post < ApplicationRecord
  include UserAssociable
  validates :title, presence: true
end
