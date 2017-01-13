require 'rails_helper'

describe Item do

  let(:invalid_item_name) {Item.create(emoji: "👽", price: 10)}
  let(:invalid_item_emoji) {Item.create(name: "sloth", price: 10)}
  let(:invalid_item_price) {Item.create(name: "iSCREAM", emoji: "👽")}
  let(:item_name) {Item.create(name: "Alien", emoji: "👽", price: 10)}

  it "item can have name" do
    expect(item_name.name).to eq "Alien"
  end

  it "item invalid without name" do
    expect(invalid_item_name).not_to be_valid
  end

  it "item can have emoji" do
    expect(item_name.emoji).to eq "👽"
  end

  it "item invalid without emoji" do
    expect(invalid_item_emoji).not_to be_valid
  end

  it "item can have price" do
    expect(item_name.emoji).to eq "👽"
  end

  it "item invalid without price" do
    expect(invalid_item_price).not_to be_valid
  end

end
