require 'rails_helper'

describe FriendshipInteraction do

  let(:owner) {User.create(name: "Josh", username: "josh", password: "123")}
  let(:pet) {Pet.create(name: "Sharky the shark dog", owner_id: owner.id, mood_level: 12)}
  let(:petfriend) {User.create(name: "The Babdook", username: "sp00kyd00d", password: "2sp00ky")}
  let(:frandz) {Friendship.create(pet_id: pet.id, user_id: petfriend.id)}
  let(:frand_interaction) {FriendshipInteraction.create(friendship_id: frandz.id, kind: "whatevzz")}
  let(:invalid_frand_interaction_friendship_id) {FriendshipInteraction.create(kind: "whatevzz")}
  let(:invalid_frand_interaction_kind) {FriendshipInteraction.create(friendship_id: frandz.id)}

  it "valid friendship interaction with friendship_id and kind" do
    expect(frand_interaction).to be_valid
  end

  it "invalid without a friendship_id" do
    expect(invalid_frand_interaction_friendship_id).not_to be_valid
  end

  it "invalid without a kind" do
    expect(invalid_frand_interaction_kind).not_to be_valid

  end
end
