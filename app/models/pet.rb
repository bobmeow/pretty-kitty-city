class Pet < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_many :friendships
  has_many :people_friends, through: :friendships, source: :user
  validates :name, presence: :true

  def is_happy?
    if mood_level >= 15
      "😾"
    elsif mood_level >= 10
      "😻"
    elsif mood_level >= 7
      "😸"
    elsif mood_level <= 3
      "😿"
    else
      "🐱"
    end
  end

  def self.needs_love
    self.where(mood_level: [0..6]).shuffle.first
  end

  def self.new_cat
    self.order(created_at: :desc).first
  end

  def self.surprise_cat
    self.order(created_at: :asc).shuffle.first
    #self.limit(1).order("RANDOM()")
  end

  # def is_friend?
  #   user = User.find(current_user)
  #   people_friends.pluck(:id).include? user.id
  # end

  # def is_owner?
  #   user = User.find(current_user)
  #   owner_id == user.id
  # end

  # def is_friend_or_owner
  #   is_friend? || is_owner?
  # end

  def current_user
    session[:user_id]
  end

end
