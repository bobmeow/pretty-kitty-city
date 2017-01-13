require 'rails_helper'

describe Pet do

  let(:user) {User.create(name: "Josh", username: "josh", password: "123")}
  let(:angry_owner) {User.create(name: "ANGRY", username: "angry", password: "123")}
  let(:valid_pet) {Pet.create(name: "Sharky the shark dog", owner_id: user.id, mood_level: 12)}
  let(:invalid_pet) {Pet.create(owner_id: user.id)}
  let(:sad_pet) {Pet.create(name: "Dad Cat", owner_id: 2, mood_level: 3)}
  let(:neutral_pet) {Pet.create(name: "Kitty Purry", owner_id: 3, mood_level: 6)}
  let(:angry_pet) {Pet.create(name: "tiny wee kitty", owner_id: angry_owner.id, mood_level: 15)}

  it "is valid with a name" do
    expect(valid_pet).to be_valid
  end

  it "is invalid without a name" do
    invalid_pet.valid?
    expect(invalid_pet.errors[:name]).to include("can't be blank")
  end


  it "returns the happy emoji if cat is happy" do
    expect(valid_pet.is_happy?).to eq "😻"
  end

  it "returns the sad emoji if cat is sad" do
    expect(sad_pet.is_happy?).to eq "😿"
  end

  it "returns the neutral cat emoji if cat's mood is mid-level" do
    expect(neutral_pet.is_happy?).to eq "🐱"
  end

  it "returns the angry cat emoji if cat's mood is 15" do
    expect(angry_pet.is_happy?).to eq "😾"
  end

  it "returns the pet that was created last" do
    expect(Pet.new_cat).to eq Pet.last
  end

end
