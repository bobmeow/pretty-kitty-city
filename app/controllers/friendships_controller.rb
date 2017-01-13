class FriendshipsController < ApplicationController

  def self.friend_adding_leaderboard
   users_with_count = self.group(:user_id).order('count_id desc').count('id')
   users = User.find(users_with_count.keys[0..9]).pluck(:username)
   counts = users_with_count.values[0..9]
   @friendship_leaders = users.zip(counts)
  end
end
