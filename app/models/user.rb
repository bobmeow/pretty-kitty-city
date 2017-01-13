class User < ApplicationRecord
  has_one :pet, :foreign_key => 'owner_id'
  has_many :friendships
  has_many :pet_friends, through: :friendships, source: :pet
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
  has_many :owner_interactions

#analytics
  def self.most_caramel_points
    self.order(caramel_points: :desc).limit(10).pluck(:username)
  end

end
