class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :comments
  has_many :todos
  has_many :news
  has_many :evaluations
  has_many :appropriations
  has_many :credit_cards
  has_one :address




  validates :encrypted_password, presence: true, uniqueness: true, length: { minimum: 7 }, confirmation: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  
  validates :nickname, presence: true

  VALID_ZENKAKU_REGEX = /\A[^ -~｡-ﾟ]+\z/
  validates :lastname, presence: true, format: { with: VALID_ZENKAKU_REGEX }
  validates :firstname, presence: true, format: { with: VALID_ZENKAKU_REGEX }

  VALID_FURIGANA_REGEX = /\A[ぁ-んァ-ヶー－]+\z/
  validates :lastname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }
  validates :firstname_kana, presence: true, format: { with: VALID_FURIGANA_REGEX }

  validates :birthdate, presence: true

  VALID_PHONE_REGEX = /\A[0-9]{10,11}\z/
  validates :telephone_number, presence: true, format: { with: VALID_PHONE_REGEX }

  
end
