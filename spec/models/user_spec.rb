require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '商品出品ができる場合' do
      it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birthdayが存在すれば登録できること" do
        expect(@user).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it "nicknameが空では登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "emailに@がないと登録できない" do
        @user.email = "aaagmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end

      it "passwordが半角英数字以外では登録できない" do
        @user.password = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "passwordが数字のみでは登録できないこと" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "passwordが全角では登録できないこと" do
        @user.password = "ああああああ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end

      it "last_nameとfirst_nameが空では登録できない" do
        @user.last_name = ""
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name can't be blank", "First name can't be blank" 
      end

      it "last_nameとfirst_nameが全角でなければ、登録できない" do
        @user.last_name = "yamada"
        @user.first_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name is invalid", "First name is invalid"
      end

      it "last_name_kanaとfirst_name_kanaが空では登録できない" do
        @user.last_name_kana = ""
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana can't be blank", "First name kana can't be blank"
      end

      it "last_name_kanaとfirst_name_kanaがカタカナでなければ、登録できない" do
        @user.last_name_kana = "やまだ"
        @user.first_name_kana = "たろう"
        @user.valid?
        expect(@user.errors.full_messages).to include "Last name kana is invalid", "First name kana is invalid"
      end

      it "birthdayが空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end