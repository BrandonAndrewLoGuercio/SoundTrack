require 'rails_helper'

describe User do
  before :each do
    @user1 = User.create email: "user1@foo.com", password: 'foobarbaz'
    @user2 = User.create email: "user2@foo.com", password: 'foobarbaz'
    @user3 = User.create email: "user3@foo.com", password: "foobarbaz"
    @user4 = User.create email: "user4@foo.com", password: "foobarbaz"

  end

  describe User do
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
  end

end
