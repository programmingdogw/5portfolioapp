class News < ApplicationRecord
  belongs_to :user

  validates :lead_text, presence: true
  validates :content_text, presence: true
  
end
