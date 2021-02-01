require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入機能' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全項目入力し、商品が買える場合' do
      expect(@order_address).to be_valid
    end

    it '郵便番号が空で商品を購入できない' do
      @order_address.postal_code=""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid")
    end

    it '郵便番号にハイフンがなく商品を購入できない' do
      @order_address.postal_code="1111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '郵便番号が全角文字であり商品を購入できない' do
      @order_address.postal_code="１１１-１１１１"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '郵便番号が6桁以下で商品を購入できない' do
      @order_address.postal_code="11-1111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '郵便番号が8桁以上で商品を購入できない' do
      @order_address.postal_code="111-11111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it '都道府県が空で商品を購入できない' do
      @order_address.prefecture_id=nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank", "Prefecture is not a number")
    end

    it '都道府県が選択されておらず商品を購入できない' do
      @order_address.prefecture_id= 1
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it '市区町村が空で商品を購入できない' do
      @order_address.city= ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空で商品を購入できない' do
      @order_address.address= ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が空で商品を購入できない' do
      @order_address.phone_number= ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が10桁以下で商品を購入できない' do
      @order_address.phone_number= "1111111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it '電話番号が12桁以上で商品を購入できない' do
      @order_address.phone_number= "111111111111"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
  end
end
