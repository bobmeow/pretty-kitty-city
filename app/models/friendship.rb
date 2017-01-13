class Friendship < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :friendship_interactions

  def self.friend_adding_leaderboard
   users_with_count = self.group(:user_id).order('count_id desc').count('id')
   users = User.find(users_with_count.keys[0..9]).pluck(:username)
   counts = users_with_count.values[0..9]
   users.zip(counts)
  end

  def self.most_popular_cats
   pets_with_count = self.group(:pet_id).order('count_id desc').count('id')
   pets = Pet.find(pets_with_count.keys).pluck(:name, :id)
   counts = pets_with_count.values[0..9]
   pets.zip(counts)
  end 
end
