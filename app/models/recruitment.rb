class Recruitment < ApplicationRecord
  has_one :record
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  validates :heading, :content, :price, :image, :category_id, presence: true
  validates :category_id, numericality: { other_than: 1, message: "を入力してください"}
  validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 500, less_than_or_equal_to: 999999, message: "を¥500〜999,999に訂正してください"}
end
