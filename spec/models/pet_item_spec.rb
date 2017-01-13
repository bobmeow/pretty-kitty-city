require 'rails_helper'

describe PetItem do

  let(:user) {User.create(name: "Josh", username: "josh", password: "123")}
  let(:pet) {Pet.create(name: "Sharky the shark dog", owner_id: user.id, mood_level: 12)}
  let(:item) {Item.create(name: "something_cool", emoji: "👌", price: 666)}
  let(:valid_pet_item) {PetItem.create(pet_id: pet.id, item_id: item.id)}
  let(:invalid_pet_item_pet_id) {PetItem.create(item_id: item.id)}
  let(:invalid_pet_item_item_id) {PetItem.create(pet_id: pet.id)}

  it "is valid with a pet id and item id" do
    expect(valid_pet_item).to be_valid
  end

  it "is invalid without a pet id" do
    expect(invalid_pet_item_pet_id).not_to be_valid
  end

  it "is invalid without a item id" do
    expect(invalid_pet_item_item_id).not_to be_valid
  end

end
