class Group < ApplicationRecord
  has_one_attached :image
  
  has_many :books
  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true  
end
