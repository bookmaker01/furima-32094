
require 'rails_helper'
 RSpec.describe User, type: :model do
   describe 'ユーザー新規登録' do
     it "nicknameが空だと登録できない" do
      user = User.new(nickname: "", email: "test@test", password: "11111a", password_confirmation: "11111a", first_name:"太朗", last_name: "山田",
      first_name_kana: "タロウ", last_name_kana: "ヤマダ", birthday:"2000/11/11")
       user.valid?
       expect(user.errors.full_messages).to include("Nickname can't be blank")
     end
     it "emailが空では登録できない" do
      user = User.new(nickname: "aa", email: "", password: "11111a", password_confirmation: "11111a", first_name:"太朗", last_name: "山田",
      first_name_kana: "タロウ", last_name_kana: "ヤマダ", birthday:"2000/11/11")
       user.valid?
       expect(user.errors.full_messages).to include("Email can't be blank")
     end
     it "passwordが空では登録できない" do
      user = User.new(nickname: "aa", email: "test@test", password: "", password_confirmation: "11111a", first_name:"太朗", last_name: "山田",
      first_name_kana: "タロウ", last_name_kana: "ヤマダ", birthday:"2000/11/11")
       user.valid?
       expect(user.errors.full_messages).to include("Password can't be blank")
     end
     it "first_nameが空では登録できない" do
      user = User.new(nickname: "aa", email: "test@test", password: "11111a", password_confirmation: "11111a", first_name:"", last_name: "山田",
      first_name_kana: "タロウ", last_name_kana: "ヤマダ", birthday:"2000/11/11" )
       user.valid?
       expect(user.errors.full_messages).to include("First name can't be blank")
     end
     it "last_nameが空では登録できない" do
      user = User.new(nickname: "aa", email: "test@test", password: "11111a", password_confirmation: "11111a", first_name:"太朗", last_name: "",
      first_name_kana: "タロウ", last_name_kana: "ヤマダ", birthday:"2000/11/11")
       user.valid?
       expect(user.errors.full_messages).to include("Last name can't be blank")
     end
     it "first_name_kanaが空では登録できない" do
      user = User.new(nickname: "aa", email: "test@test", password: "11111a", password_confirmation: "11111a", first_name:"太朗", last_name: "山田",
      first_name_kana: "", last_name_kana: "ヤマダ", birthday:"2000/11/11")
       user.valid?
       expect(user.errors.full_messages).to include("First name kana can't be blank")
     end
     it "last_name_kanaが空では登録できない" do
            user = User.new(nickname: "aa", email: "test@test", password: "11111a", password_confirmation: "11111a", first_name:"太朗", last_name: "山田",
      first_name_kana: "タロウ", last_name_kana: "", birthday:"2000/11/11")
       user.valid?
       expect(user.errors.full_messages).to include("Last name kana can't be blank")
     end
     it "birthdayが空では登録できない" do
      user = User.new(nickname: "aa", email: "test@test", password: "11111a", password_confirmation: "11111a", first_name:"太朗", last_name: "山田",
      first_name_kana: "タロウ", last_name_kana: "ヤマダ", birthday:"")
       user.valid?
       expect(user.errors.full_messages).to include("Birthday can't be blank")
     end
     it "password_confirmationが空では登録できない" do
      user = User.new(nickname: "aa", email: "test@test", password: "11111a", password_confirmation: "", first_name:"太朗", last_name: "山田",
      first_name_kana: "タロウ", last_name_kana: "ヤマダ", birthday:"2000/11/11")
       user.valid?
       expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
     end
   end
 end