class Order < ApplicationRecord
belongs_to :user
belongs_to :item
has_one_attached :shipping_address
end
