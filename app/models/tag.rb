class Tag < ApplicationRecord
  has_many :tagconnects, dependent: :destroy
  has_many :pictures,through: :tagconnects

  validates :name, uniqueness: true, presence: true
end
