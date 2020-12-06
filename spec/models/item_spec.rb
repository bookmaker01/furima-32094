require 'rails_helper'
describe Item do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
      it '出品できる時' do
        expect(@item).to be_valid
      end
    context '出品ができないとき' do
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
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 0")
      end
      it " 商品の状態についての情報が必須であること" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 0")
      end
      it "配送料の負担についての情報が必須であること" do
        @item.burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 0")
      end
      it "発送元の地域についての情報が必須であること" do
        @item.area_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 0")
      end  
      it "発送までの日数についての情報が必須であること" do
        @item.guideline_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Guideline must be other than 0")
      end  
      it "価格についての情報が必須であること" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "価格は半角数字であること" do
        @item.price = "１１１"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "299以下であれば保存できない" do
        @item.price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
      it "10000000以上であれば保存できない" do
        @item.price = 1000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end
    end
  end
end
