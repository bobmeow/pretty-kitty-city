class Pet < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_many :friendships
  has_many :people_friends, through: :friendships, source: :user
  has_many :pet_items
  has_many :items, through: :pet_items
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
  end

  #analytics
  def self.happiest_cats
    self.where(mood_level: [10..15]).pluck(:name, :mood_level)
  end

  ###Methods for Heroku Rake task to decrease pet mood level

  ###this is the rake task
  def self.update_mood_level
    Pet.where("mood_level > ?", 0).update_all("mood_level = mood_level - 1")
  end




end
