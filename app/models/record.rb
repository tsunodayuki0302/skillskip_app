class Record < ApplicationRecord
  belongs_to :user
  belongs_to :recruitment
  has_one :order
end