class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: { maximum: 40, message: '40文字以内にしてください' }
    validates :text, length: { maximum: 1000, message: '1000文字以内にしてください' }
    validates :image
    with_options numericality: { other_than: 1, message: '選択していない項目があります' } do
      validates :category_id
      validates :sales_id
      validates :shipping_id
      validates :prefecture_id
      validates :scheduled_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
    end
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  belongs_to :category
  belongs_to :sales
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :scheduled
  has_one    :purchase
end