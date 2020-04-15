class CreditCard < ApplicationRecord
  belongs_to :user

  validates :bank, presence: true
  validates :number, presence: true
  
end
