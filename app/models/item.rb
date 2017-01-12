class Item < ApplicationRecord
  has_many :pet_items
  has_many :items, through: :pet_items
end
