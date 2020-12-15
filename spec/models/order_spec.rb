require 'rails_helper'
describe Order do
  before do
    @order = FactoryBot.build(:item)
  end
  describe '商品購入' do
    context '購入ができるとき' do
    it '購入できる時' do
      expect(@order).to be_valid
    end
  end
    context '出品ができないとき' do
      it '郵便番号が必須であること' do
        @order.postalcode = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("postalcode can't be blank")
      end
      it '都道府県が必須であること' do
        @order.prefecture_id = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("prefecture_id can't be blank")
      end
      it '市区町村が必須であること' do
        @order.municipality = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("municipality can't be blank")
      end
      it '番地が必須であること' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("address can't be blank")
      end
      it '電話番号が必須であること' do
        @order.phone_number = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("phone_number can't be blank")
      end
      