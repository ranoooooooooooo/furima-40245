require 'rails_helper'

RSpec.describe OrderAddressForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address_form = FactoryBot.build(:order_address_form, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do

    context '商品購入できる場合' do
      it '必要事項を全て過不足なく入力すると商品購入できる' do
        expect(@order_address_form).to be_valid
      end

      it 'buildingは空でも商品購入できる' do
        @order_address_form.building = ''
        expect(@order_address_form).to be_valid
      end
    end

    context '商品購入できない場合' do
      it '郵便番号が空では商品購入できない' do
        @order_address_form.postcode = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Postcode can't be blank")
      end

      it '郵便番号が「3桁ハイフン4桁」の半角文字列でなければ商品購入できない' do
        @order_address_form.postcode = "３３３３３３"
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Postcode 半角数字でハイフンを含めて入力してください")
      end

      it '都道府県が空では商品購入できない' do
        @order_address_form.prefecture_id = 1
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Prefecture 都道府県を選択してください")
      end

      it '市区町村が空では商品購入できない' do
        @order_address_form.city = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では商品購入できない' do
        @order_address_form.street = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Street can't be blank")
      end

      it '電話番号が空では商品購入できない' do
        @order_address_form.phone_number = ''
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が10桁以上11桁以内の半角数値でなければ商品購入できない' do
        @order_address_form.phone_number = "３３３３３３"
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Phone number 半角数字で10桁以上11桁以内で入力してください")
      end

      it '電話番号が10桁以上11桁以内の半角数値でなければ商品購入できない' do
        @order_address_form.phone_number = "333333"
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Phone number 半角数字で10桁以上11桁以内で入力してください")
      end
      
      it 'ユーザーが紐づいていなければ商品購入できない' do
        @order_address_form.user_id = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("User can't be blank")
      end

      it 'アイテムが紐づいていなければ商品購入できない' do
        @order_address_form.item_id = nil
        @order_address_form.valid?
        expect(@order_address_form.errors.full_messages).to include("Item can't be blank")
      end

    end
  end
end
