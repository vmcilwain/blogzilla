class Role < ApplicationRecord
  validates :name, presence: true
  has_many :permissions, dependent: :destroy
  has_many :users, through: :permissions
end
