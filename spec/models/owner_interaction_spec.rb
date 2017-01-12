require 'rails_helper'

describe OwnerInteraction do

  let(:user) {User.create(name: "Josh", password: "123")}
  let(:valid_owner) {OwnerInteraction.create(owner_id: user.id, kind: "feed")}
  let(:valid_kind) {OwnerInteraction.create(owner_id: user.id, kind: "feed")}
  
  it "has an owner" do
    expect(valid_owner).to be_valid
  end

  it "has an owner action kind" do
    expect(valid_kind).to be_valid
  end


  
end
