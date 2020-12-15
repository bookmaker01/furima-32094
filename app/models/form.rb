class Form
  include ActiveModel::Model
  attr_accessor :postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id,:token
  with_options presence: true do
  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :municipality
  validates :address
  validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone_number,format: {with: /\A[a-zA-Z0-9]+\z/, message: "is invalid. Include hyphen(-)"}
  #validates :token
end
  validates :prefectures_id, numericality: { other_than: 0, message: "can't be blank" }
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create!(postal_code: postal_code, prefectures_id: prefectures_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
