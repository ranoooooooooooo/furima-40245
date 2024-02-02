class OrderAddressForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id,
                :city, :street, :building, :phone_number, :order_id

  with_options presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "半角数字でハイフンを含めて入力してください"}
    validates :prefecture_id, numericality: { other_than: 1, message: "都道府県を選択してください" }
    validates :city
    validates :street
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "半角数字で10桁以上11桁以内で入力してください"}
    validates :user_id
    validates :item_id
  end
  
  def save
    if valid?
      persist!
      true
    else
      false
    end
  end

  private

  def persist!
    # Order モデルへの保存
    order = Order.create!(
      user_id: user_id,
      item_id: item_id
    )

    # Address モデルへの保存
    Address.create!(
      postcode:      postcode,
      prefecture_id: prefecture_id,
      city:          city,
      street:        street,
      building:      building,
      phone_number:  phone_number,
      order_id:      order.id
    )
  end
end