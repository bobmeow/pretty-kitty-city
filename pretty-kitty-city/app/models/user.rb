class User < ApplicationRecord
  has_one :pet, :foreign_key => 'owner_id'
  has_many :friendships
  has_many :pet_friends, through: :friendships, source: :pet
end
