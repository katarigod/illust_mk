class ChangeCoin < ApplicationRecord
  belongs_to :customer, optional: true
end