require 'rails_helper'

describe Friendship do
  let(:owner) {User.create(name: "Josh", username: "josh", password: "123")}
  let(:pet) {Pet.create(name: "Sharky the shark dog", owner_id: owner.id, mood_level: 12)}
  let(:petfriend) {User.create(name: "The Babdook", username: "sp00kyd00d", password: "2sp00ky")}
  let(:valid_frandz) {Friendship.create(pet_id: pet.id, user_id: petfriend.id)}
  let(:invalid_frandz_pet_id) {Friendship.create(user_id: petfriend.id)}
  let(:invalid_frandz_user_id) {Friendship.create(pet_id: pet.id)}

  it "is valid with pet id and user id" do
    expect(valid_frandz).to be_valid
  end

  it "is invalid without pet id" do
    expect(invalid_frandz_pet_id).not_to be_valid
  end

  it "is invalid without user id" do
    expect(invalid_frandz_user_id).not_to be_valid
  end

end
