require 'rails_helper'
describe Order do
  before do
    seller = FactoryBot.create(:user)
    buyer = FactoryBot.create(:user, email: "abc@com")
    item = FactoryBot.create(:item , user_id: buyer.id)
    @order = FactoryBot.build(:form, user_id: seller.id, item_id: item.id)
    sleep (0.5)
  end
  describe '商品購入' do
    context '購入ができるとき' do
    it '購入できる時' do
      expect(@order).to be_valid
    end
    it '建物名がなくても購入できる' do
      @order.building_name = ''
      expect(@order).to be_valid
    end
  end
    context '出品ができないとき' do
      it '郵便番号が必須である事' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが入っている事' do
        @order.postal_code = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include( "Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が0では購入出来ない' do
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
      it '電話番号が必須である事' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁である事' do
        @order.phone_number = '1234567890'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. ")
      end
      it '電話番号が英数混合では登録できないこと' do
        @order.phone_number = '1234567890a'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid. ")
      end
    end
    end
    end