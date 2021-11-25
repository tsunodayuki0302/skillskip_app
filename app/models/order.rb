class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :telephone_number, format:{with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :recruitment_id
  end

  # def save
  #   donation = Donation.create(price: price, user_id: user_id)
  #   # 住所を保存する
  #   # donation_idには、変数donationのidと指定する
  #   Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, donation_id: donation.id)
  # end

  def save
    purchase_record = PurchaseRecord.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id)
  end
end

