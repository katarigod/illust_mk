class Buycoin < ApplicationRecord
  belongs_to :customer

  validates :piece, presence: true, numericality: {only_integer: true}, length: { maximum: 7 }
end
