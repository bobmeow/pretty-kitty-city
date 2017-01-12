class Friendship < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :friendship_interactions
end
