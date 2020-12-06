require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '新規登録ができないとき' do
      it "商品画像を1枚つけることが必須であること" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "商品名が必須であること" do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "商品の説明が必須であること" do
        @item.explanation = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end  
      it "カテゴリーの情報が必須であること" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it " 商品の状態についての情報が必須であること" do
        @item.status_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end  
      it "発送までの日数についての情報が必須であること" do
        @item.guideline_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Guideline can't be blank")
      end  
      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格は半角数字であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid. Input half-width characters.")
      end
      it "価格の範囲が、¥300~¥9,999,999の間であること" do
        @item.price = "100"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
