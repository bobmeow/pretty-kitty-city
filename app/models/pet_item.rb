class PetItem < ApplicationRecord
  belongs_to :item
  belongs_to :pet
end
