require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.build(:item)
    end

    describe '商品出品機能' do
      context '商品出品がうまくいくとき' do
        it 'ログイン状態で、画像、名前、説明、カテゴリー、状態、配送料負担者、配送元地域、発送日数、価格が存在すれば商品出品の保存が可能' do
          expect(@item).to be_valid
        end
      end

      context '商品出品がうまくいかないとき' do
        it 'userが紐付いていないと保存できないこと' do
          @item.user = nil
          @item.valid?
          expect(@item.errors.full_messages).to include('User must exist')
        end

        it '画像が空では保存できないこと' do
          @item.image = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Image can't be blank")
        end

        it 'nameが空では保存できないこと' do
          @item.name = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Name can't be blank")
        end

        it 'nameが40文字以上では保存できないこと' do
          @item.name = 'a' * 41
          @item.valid?
          expect(@item.errors.full_messages).to include('Name 40文字以内にしてください')
        end

        it '説明が空では保存できないこと' do
          @item.text = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("text can't be blank")
        end

        it '説明が1000文字以上では保存できないこと' do
          @item.text = 'a' * 1001
          @item.valid?
          expect(@item.errors.full_messages).to include('text 1000文字以内にしてください')
        end

        it 'カテゴリーを選択していないと保存できないこと' do
          @item.category_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Category 選択していない項目があります')
        end

        it '状態を選択していないと保存できないこと' do
          @item.sales_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('sales 選択していない項目があります')
        end

        it '配送料負担者を選択していないと保存できないこと' do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping 選択していない項目があります')
        end

        it '配送元地域を選択していないと保存できないこと' do
          @item.prefecture_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Prefecture 選択していない項目があります')
        end

        it '配送元日数を選択していないと保存できないこと' do
          @item.shipping_id = 1
          @item.valid?
          expect(@item.errors.full_messages).to include('Shipping 選択していない項目があります')
        end

        it '価格が空では保存できないこと' do
          @item.price = nil
          @item.valid?
          expect(@item.errors.full_messages).to include("Price can't be blank")
        end

        it '価格が¥300より低いと保存できないこと' do
          @item.price = 299
          @item.valid?
          expect(@item.errors.full_messages).to include('Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください')
        end

        it '価格が¥9,999,999より高いと保存できないこと' do
          @item.price = 10, 0o00, 0o00
          @item.valid?
          expect(@item.errors.full_messages).to include('Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください')
        end

        it '価格が全角数字では保存できないこと' do
          @item.price = '１００'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください')
        end

        it '価格が半角英数混合では保存できないこと' do
          @item.price = '1000k'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください')
        end

        it '価格が半角英語では保存できないこと' do
          @item.price = 'one thousand'
          @item.valid?
          expect(@item.errors.full_messages).to include('Price (金額)を¥300 ~ 9,999,999 内で半角数字入力してください')
        end
      end
    end
  end
end