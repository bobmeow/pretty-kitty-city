class Pet < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_many :friendships
  has_many :people_friends, through: :friendships, source: :user

  def is_friend?
    user = User.find(current_user)
    people_friends.pluck(:id).include? user.id
  end

  def is_owner?
    user = User.find(current_user)
    owner_id == user.id
  end

  def is_friend_or_owner
    is_friend? || is_owner?
  end

  def current_user
    session[:user_id]
  end

end
