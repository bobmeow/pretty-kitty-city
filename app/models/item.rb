class Item < ApplicationRecord
  has_many :pet_items
  has_many :pets, through: :pet_items
end
