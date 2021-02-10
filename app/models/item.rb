class Item < ApplicationRecord
  with_options presence: true do
    validates :name, :text, :image
    
    with_options numericality: { other_than: 1 } do
      validates :category_id, :sales_id, :shipping_id, :prefecture_id, :scheduled_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999 } 
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

end