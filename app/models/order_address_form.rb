class OrderAddressForm
  include ActiveModel::Model
  attr_accessor :user_id,:item_id,:postcode,:prefecture_id,:city,
                :street,:building,:phone_number,:order_id

  validates :user_id,:item_id,:postcode,:prefecture_id,:city,
            :street,:building,:phone_number,:order_id,
            presence: true

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