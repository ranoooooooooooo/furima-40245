class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :orders

  validates :password,
            format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "パスワードは半角英数字のみ、半角英数字混合で設定してください" }
  
  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "お名前は全角文字で入力してください" }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "お名前は全角文字で入力してください" }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "フリガナは全角カタカナのみで入力してください" }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "フリガナは全角カタカナのみで入力してください" }
    validates :birthday
  end

end
