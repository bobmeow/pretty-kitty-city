class Pet < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_many :friendships
  has_many :people_friends, through: :friendships, source: :user
  validates :name, presence: :true
  #
  # def is_friend?
  #   people_friends.pluck(:id).include? session[:user_id]
  # end
  #
  # def is_owner?
  #   owner_id == session[:user_id]
  # end
  #
  # def is_friend_or_owner
  #   is_friend? || is_owner?
  # end

  # def current_user
  #   session[:user_id]
  # end
end
