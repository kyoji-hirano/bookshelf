class Group < ApplicationRecord
  has_one_attached :image
  
  has_many :books
  has_many :group_users, dependent: :destroy
  has_many :users
  validates :name, presence: true, uniqueness: true  
end
