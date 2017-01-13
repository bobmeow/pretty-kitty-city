class Friendship < ApplicationRecord
  belongs_to :pet
  belongs_to :user
  has_many :friendship_interactions

  validates :pet_id, :user_id, presence: true

  def self.friend_adding_leaderboard
     Friendship.joins(:user).group(:username).order('count_id desc').count('id')
  end

  def self.most_popular_cats
    Friendship.joins(:pet).group(:pet_id, :name).order('count_id desc').count('id')
  end
end
