class AnalyticsController < ApplicationController

  def index
    @latest_friendship_interactions = FriendshipInteraction.latest_friendship_interactions
    @most_caramel_points = User.most_caramel_points
    @happiest_cats = Pet.happiest_cats
    @friend_adding_leaderboard = Friendship.friend_adding_leaderboard
    @most_popular_cats = Friendship.most_popular_cats
  end


  

  


end