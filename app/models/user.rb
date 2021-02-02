class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence; true do
    validates :nickname
    validates :last_name, format: {with: /\A[一-龥ぁ-ん]/ }
    validates :first_name, format: {with: /\A[一-龥ぁ-ん]/ }
    validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday, presence: true
  end
  validates :password, format: {with: /\A[a-z\d]+\z/i}
end
