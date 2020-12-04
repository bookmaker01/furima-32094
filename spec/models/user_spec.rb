
require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end
   describe 'ユーザー新規登録' do
    context '新規登録ができるとき' do
      it "nickname,email、first_name,last_name,first_name_kana,last_name_kana,birthday,passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
     it "nicknameが空だと登録できない" do
      @user.nickname = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      @user.email = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Email can't be blank")
     end
     it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
     end
     it "passwordが空では登録できない" do
      @user.password = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password can't be blank")
     end
     it "passwordが5文字以下であれば登録できない" do
      @user.password = "aaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
     end
     it "passwordが半角英字のみの場合登録できない" do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
     end
     it "passwordが半角数字のみの場合登録できない" do
      @user.password = "123456"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
     end
     it "passwordが全角英数字の場合登録できない" do
      @user.password = "１２３ABC"
       @user.valid?
       expect(@user.errors.full_messages).to include("Password is invalid. Input half-width characters.")
     end
     it "passwordとpassword_confirmationが一致しない場合登録できない" do
      @user.password = "123456"
      @user.password_confirmation = "1234567"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
     it "first_nameが空では登録できない" do
      @user.first_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("First name can't be blank")
     end
     it "first_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user.first_name = "ﾀﾅｶ"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
     end
     it "last_nameが空では登録できない" do
      @user.last_name = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name can't be blank")
     end
     it "last_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
      @user.last_name = "ﾀﾅｶ"
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
     end
     it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana can't be blank")
     end
     it "first_name_kanaのフリガナが全角（カタカナ）以外の場合登録できない" do
      @user.first_name_kana = "ﾀﾅｶ"
       @user.valid?
       expect(@user.errors.full_messages).to include("First name kana is invalid. Input full-width characters.")
     end
     it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it "last_name_kanaのフリガナが全角（カタカナ）以外の場合登録できない" do
      @user.last_name_kana = "ﾀﾛｳ"
       @user.valid?
       expect(@user.errors.full_messages).to include("Last name kana is invalid. Input full-width characters.")
     end
     it "birthdayが空では登録できない" do
      @user.birthday = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Birthday can't be blank")
     end
     it "password_confirmationが空では登録できない" do
      @user.password_confirmation = ""
       @user.valid?
       expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
   end
 end