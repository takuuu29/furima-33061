require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe PurchaseAddress do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, item_id: @item.id, user_id: @user.id)
    end

    describe '商品購入機能' do
      context '購入がうまくいくとき' do
        it 'user_id,item_id,token,postal_code,prefecture_id,city,address_line,phone_numberが存在すれば購入できるとき' do
          expect(@purchase_address).to be_valid
        end

        it '建物名が空でも購入できること' do
          @purchase_address.building = nil
          expect(@purchase_address).to be_valid
        end

        it "priceとtokenがあれば保存ができること" do
          expect(@purchase_address).to be_valid
        end

      end

      context '購入がうまくいかないとき' do
        it 'user_idが空のとき' do
          @purchase_address.user_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("User can't be blank")
        end

        it 'item_idが空のとき' do
          @purchase_address.item_id = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
        end

        it 'postal_codeが空のとき' do
          @purchase_address.postal_code = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Postal code can't be blank")
        end

        it 'postal_codeがハイフン無し' do
          @purchase_address.postal_code = '1234567'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include('Postal code 郵便番号をハイフン込みで半角数字入力してください')
        end

        it 'prefectureが空のとき' do
          @purchase_address.prefecture_id = 1
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Prefecture 選択していない項目があります")
        end

        it 'cityが空のとき' do
          @purchase_address.city = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("City can't be blank")
        end

        it '住所が空のとき' do
          @purchase_address.address_line = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Address line can't be blank")
        end

        it '電話番号が空のとき' do
          @purchase_address.phone_number = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank", "Phone number 電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください")
        end

        it '電話番号に全角数字が含まれている' do
          @purchase_address.phone_number = '０００１２３４５６７８'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number 電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください")
        end

        it '電話番号が11桁を超えている' do
          @purchase_address.phone_number = '000123456789'
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Phone number 電話番号を半角数字のみ(ハイフン無し)11桁以内で入力してください")
        end

        it "tokenが空では登録できないこと" do
          @purchase_address.token = nil
          @purchase_address.valid?
          expect(@purchase_address.errors.full_messages).to include("Token クレジットカード情報が間違っています")
        end
      end
    end
  end
end