require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
  end

  it 'has the right devise modules loaded' do
    expect(@user.devise_modules).to eq([:database_authenticatable, :rememberable,
                                       :recoverable, :registerable, :validatable, :trackable])
  end

  it 'should exist' do
    expect(@user).not_to be_nil
  end

  it 'validates presence of username' do
    @user.username = nil
    expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)

    @user.username = 'foo'
    expect(@user.username).to eq("foo")
  end

  it 'validates uniqueness of username' do
    user1 = build(:user, username: @user.username)
    expect {user1.save!}.to raise_error(ActiveRecord::RecordInvalid)

    user2 = build(:user)
    expect {user2.save!}.not_to raise_error
  end

  it 'validates presence of password' do
    @user.password = nil
    expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)

    @user.password = "password1"
    expect(@user.password).to eq("password1")
  end

  it 'validates length of password' do
    @user.password = 'abc'
    expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)

    @user.password = "password1"
    expect(@user.password).to eq("password1")
  end
#
  it 'validates presence of email' do
    @user.email = nil
    expect {@user.save!}.to raise_error(ActiveRecord::RecordInvalid)

    @user.email = "foo@foo.com"
    expect(@user.email).to eq("foo@foo.com")
  end

  it 'validates uniqueness of email' do
    user1 = build(:user, email: @user.email)
    expect {user1.save!}.to raise_error(ActiveRecord::RecordInvalid)

    user2 = build(:user)
    expect {user2.save!}.not_to raise_error
  end
#
#   it "authenticates with matching username and password" do
#     expect(@user.authenticate(@user.username, @user.password)).to eq(user)
#   end
#
#   it "does not authenticate with incorrect password" do
#     expect(@user.authenticate(@user.username, "incorrect12")).to be_nil
#   end
end


