class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :family_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ }
    validates :family_kana, format: { with: /\A[ァ-ンー]+\z/ }
    validates :first_kana, format: { with: /\A[ァ-ンー]+\z/ }
    validates :nickname
    validates :birthday
  end
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  has_many :items
  has_many :orders
end
