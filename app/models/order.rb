class Order 
  include ActiveModel::Model
  attr_accessor :telephone_number, :user_id, :recruitment_id, :token

  with_options presence: true do
    validates :token
    validates :telephone_number, format:{with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :recruitment_id
  end

  def save
    record = Record.create(recruitment_id: recruitment_id, user_id: user_id)
    Address.create(telephone_number: telephone_number, record_id: record.id)
  end
end

