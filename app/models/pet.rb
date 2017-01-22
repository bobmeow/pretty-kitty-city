class Pet < ApplicationRecord
  belongs_to :owner, :class_name => 'User'
  has_many :friendships
  has_many :people_friends, through: :friendships, source: :user
  has_many :pet_items
  has_many :items, through: :pet_items
  validates :name, presence: :true
  before_save :check_mood_level

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

    #analytics  
  def self.happiest_cats
    self.where(mood_level: [10..15]).pluck(:name, :mood_level)
  end

  ###Methods for Heroku Rake task to decrease pet mood level

  ###this is the rake task
  def self.update_mood_level
    Pet.where("mood_level > ?", 0).update_all("mood_level = mood_level - 1")
  end

  def all_friendships
    self.friendships
  end

  def all_friendship_interactions_ids
  all_friendships.collect do |friendship|
      friendship.friendship_interactions.pluck(:id)
    end.flatten
  end

  def three_most_recent_interactions
    FriendshipInteraction.where(id: all_friendship_interactions_ids).select('kind, created_at, id').order(created_at: :desc).limit(3)
      # all_friendship_interactions[0].select("kind, created_at").order(created_at: :desc).limit(3)
  end

  def array_of_interaction_times
    three_most_recent_interactions.pluck(:created_at)
  end

  def convert_time
    array_of_interaction_times.collect do |time|
      time.strftime("%b %d, %I:%M:%p")
    end
  end

  def extract_kind
    three_most_recent_interactions.pluck(:kind)
  end

  def kind_conversion_for_display
    extract_kind.each do |kind|
      kind.gsub!("play","played with")
      kind.gsub!("scratch", "scratched at")
    end
  end

  def kind_and_time_array
    kind_conversion_for_display.zip(convert_time)
  end

  def check_mood_level
    if self.mood_level > 15
        self.mood_level = 15
    elsif self.mood_level < 0
        self.mood_level = 0
    end
  end


end
