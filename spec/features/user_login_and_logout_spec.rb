require 'rails_helper'

describe "the login process", :type => :feature do
  before :each do
    @user = create(:user)
  end

  it "signs me in with correct username and password" do
    visit '/users/sign_in'
      fill_in 'Username', :with => @user.username
      fill_in 'Password', :with => @user.password
      click_button 'Log in'
    expect(page).to have_content 'Welcome back'
  end

  it 'does not sign me in with incorrect password' do
    visit '/users/sign_in'
      fill_in 'Username', :with => @user.username
      fill_in 'Password', :with => 'password1'
      click_button 'Log in'
    expect(page).to have_content 'Log in'
  end

end