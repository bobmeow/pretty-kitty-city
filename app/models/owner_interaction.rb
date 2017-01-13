class OwnerInteraction < ApplicationRecord

belongs_to :owner, :class_name => 'User'

validates :owner_id, :kind, presence: true

end
