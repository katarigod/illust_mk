class Picture < ApplicationRecord
  has_one_attached:picture_image
  belongs_to :customer
  has_many :collects,dependent: :destroy
  
end
