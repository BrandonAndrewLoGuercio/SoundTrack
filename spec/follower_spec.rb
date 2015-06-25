require 'rails_helper'

describe User do
  before :each do
    @user1 = create(:user)
    @user2 = create(:user)
    @user3 = create(:user)
    @user4 = create(:user)
  end

  it "should not have followers when first created" do
    expect(@user1.followers).to eq([])
    expect(@user2.followers).to eq([])
  end


  it "should be able to return followers" do
    @user1.followers << @user2

    expect(User.find(@user1.id).followers).to eq([@user2])
  end

  it "should be able to return all followers" do
    @user1.followers << @user2
    @user1.followers << @user3
    @user1.followers << @user4

    expect(User.find(@user1.id).followers).to match_array([@user2, @user3, @user4])
  end


  it "should be able to return followings" do
    @user1.followings << @user2

    expect(User.find(@user1.id).followings).to eq([@user2])
  end

  it "should be able to return all followers" do
    @user1.followings << @user2
    @user1.followings << @user3
    @user1.followings << @user4

    expect(User.find(@user1.id).followings).to match_array([@user2, @user3, @user4])
  end


end
