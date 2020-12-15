class ShippingAddress < ApplicationRecord
belongs_to :order
with_options presence: true do
  validates :postal_code

  validates :municipality
  validates :address
  validates :phone_number
  validates :order_id
end
end
