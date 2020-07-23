class Book < ApplicationRecord
  has_one_attached :image
  belongs_to :group
  
end
