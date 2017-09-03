class FriendshipInteraction < ApplicationRecord
  belongs_to :friendship

  def self.delete_if_outdated
    FriendshipInteraction.where("created_at < ?", 3.days.ago).destroy_all
  end
end
