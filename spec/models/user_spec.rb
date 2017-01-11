require 'rails_helper'

describe User do
  let(:valid_user) {User.create(name: "Rufus", username: "roofiechan", password:'123')}
  let(:invalid_name) {User.create(name: nil, username: "roofiechan", password:'123')}
  let(:invalid_username) {User.create(name: "Rufus", username: nil, password:'123')}

  it 'is valid with a username' do
    expect(valid_user).to be_valid
  end

  it 'is invalid without a username' do
    invalid_username.valid?
    expect(invalid_username.errors[:username]).to include("can't be blank")
  end

  it 'is valid with a name' do
    expect(valid_user).to be_valid
  end

  it 'is invalid without a name' do
    invalid_name.valid?
    expect(invalid_name.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate username' do
    valid_user
    user = User.new(name: 'Kevin', username: 'roofiechan', password: '123')
    user.valid?
    expect(user.errors[:username]).to include ("has already been taken")
  end
end
