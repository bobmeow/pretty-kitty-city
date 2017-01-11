class User < ApplicationRecord
  has_one :pet, :foreign_key => 'owner_id'
  has_many :friendships
  has_many :pet_friends, through: :friendships, source: :pet
  has_secure_password
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true

end
