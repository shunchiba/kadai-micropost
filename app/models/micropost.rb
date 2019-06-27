class Micropost < ApplicationRecord
  has_many :favorites
  belongs_to :user
  has_many :favorite_user, through: :favorites, source: :user
  
  validates :content, presence: true, length: { maximum: 255 }
  
end
