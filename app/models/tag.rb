class Tag < ApplicationRecord
  has_many :tagconnects, dependent: :destroy

end
