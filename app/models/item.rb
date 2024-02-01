class Item < ApplicationRecord
  validates :item_name, :item_description, :item_category_id, :item_status_id,
            :delivery_fee_bearer_id, :prefecture_id, :days_to_ship_id, :price,
            :image, presence: true
  belongs_to :user
  has_one :order
  has_one_attached :image

  validates :price,
            numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,
            message: "価格は¥300以上、¥9,999,999以下で設定してください"  }
  validates :price,
            numericality: { with: /\A[0-9]+\z/, message: "価格は半角数字で設定してください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_status
  belongs_to :delivery_fee_bearer
  belongs_to :prefecture
  belongs_to :days_to_ship

  validates :item_category_id, :item_status_id,:delivery_fee_bearer_id,
            :prefecture_id, :days_to_ship_id,
            numericality: { other_than: 1 , message: "can't be blank"} 

end