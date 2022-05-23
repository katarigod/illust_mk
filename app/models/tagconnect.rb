class Tagconnect < ApplicationRecord
  belongs_to :tag
  belongs_to :picture
  
  validates :pi_id, presence: true
  validates :tag_id, presence: true
end
