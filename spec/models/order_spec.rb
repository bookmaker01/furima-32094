require 'rails_helper'
describe Order do
  before do
    # seller = "出品者の情報"
    # buyer = "購入者の情報"
    # item = 
    @order = FactoryBot.build(:form)
  end
  describe '商品購入' do
    context '購入ができるとき' do
    it '購入できる時' do
      expect(@order).to be_valid
    end
  end
    context '出品ができないとき' do
      it '郵便番号が必須であることかつハイフンが入っている事' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank", "Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が必須であること' do
        @order.prefectures_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include( "Prefectures can't be blank")
      end
      it '市区町村が必須であること' do
        @order.municipality = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が必須であること' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であることかつハイフンがある事' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid. Include hyphen(-)")
      end
    end
    end
    end