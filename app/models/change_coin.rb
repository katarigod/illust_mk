class ChangeCoin < ApplicationRecord
  belongs_to :customer, optional: true
  validates :piece, presence: true, numericality: {only_integer: true}, length: { maximum: 5 }
end
