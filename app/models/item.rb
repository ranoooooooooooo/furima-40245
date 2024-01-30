class Item < ApplicationRecord
  validates :item_name, :item_description, :item_category_id, :item_status_id,
            :delivery_fee_bearer_id, :prefecture_id, :days_to_ship_id, :price,
            presence: true
  belongs_to :user
  # has_one :order
  has_one_attached :image
end
