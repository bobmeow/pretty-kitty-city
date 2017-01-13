class FriendshipInteraction < ApplicationRecord
 belongs_to :friendship

 validates :friendship_id, :kind, presence: true

#analytics
  def self.latest_friendship_interactions
    FriendshipInteraction.order(:created_at).limit(10).pluck(:kind)
  end
end
