class Tagconnect < ApplicationRecord
  belongs_to :tag
  belongs_to :picture
  
  validates :picture_id, presence: true
  validates :tag_id, presence: true
end
