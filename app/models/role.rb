class Role < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :permissions, dependent: :destroy
  has_many :users, through: :permissions
end
