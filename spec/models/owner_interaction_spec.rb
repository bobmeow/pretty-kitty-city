require 'rails_helper'

describe OwnerInteraction do

  let(:owner) {User.create(name: "Rufus", username: "roofiechan", password:'123', caramel_points: '4')}
  let(:valid_interaction) {OwnerInteraction.create(owner_id: owner.id, kind: "feed")}
  let(:invalid_interaction_owner) {OwnerInteraction.create(kind: "feed")}
  let(:invalid_interaction_kind) {OwnerInteraction.create(owner_id: owner.id)}

  it "has an owner" do
    expect(valid_interaction.owner_id).to eq owner.id
  end

  it "invalid without an owner" do
    expect(invalid_interaction_owner).not_to be_valid
  end

  it "has an owner action kind" do
    expect(valid_interaction).to be_valid
  end

  it "invalid without a kind" do
    expect(invalid_interaction_kind).not_to be_valid
  end

end
