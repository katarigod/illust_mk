class Picture < ApplicationRecord
  has_one_attached:picture_image
  belongs_to :customer
  has_many :collects,dependent: :destroy

  # def self.image_url
  #   picture_image.attached? ? url_for(picture_image) : nil
  # end
end
