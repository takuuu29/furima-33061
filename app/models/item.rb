class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :text
    validates :category
    validates :sales
    validates :shipping
    validates :prefecture
    validates :scheduled
    validates :price
  end
  belongs_to :user
  has_one_attached :image
end
