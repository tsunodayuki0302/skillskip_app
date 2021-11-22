class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :telephone_number, format:{with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :recruitment_id
  end
end

