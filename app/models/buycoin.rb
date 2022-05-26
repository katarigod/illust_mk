class Buycoin < ApplicationRecord
  belongs_to :customer

  validates :piece, presence: true
end
