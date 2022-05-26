class ChangeCoin < ApplicationRecord
  belongs_to :customer, optional: true
  validates :piece, presence: true
end
