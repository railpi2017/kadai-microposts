class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :relationship_favorites
  has_many :likemans, through: :relationship_favorites, source: :user

  def likeman?(other_user)
    self.likemans.include?(other_user)
  end
  
  
end
