require 'rails_helper'

describe "the signup process" do

  it "brings me to signup page from the homepage" do
    # signup_page
    visit root_path
    click_link 'Sign up'
    #
    expect(current_path).to eq new_user_registration_path
    expect(page).to have_content 'Sign up'
    expect(page).to_not have_content 'Sign in'
  end

  it "signs me up with unique and valid username, email, and password" do
    # signup_page
    visit root_path
    click_link 'Sign up'
    #
    fill_in 'user[username]', with: 'user1'
    fill_in 'user[email]', with: 'user1@example.com'
    fill_in 'user[password]', with: 'password1'
    fill_in 'user[password_confirmation]', with: 'password1'
    click_button 'Sign up'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome back'
    expect(page).to_not have_content 'Log in'
  end
end

feature "the login process" do
  before :each do
    @user = create(:user)
  end

  it "signs me in with correct username and password" do
    # login_success(@user)
    visit '/users/sign_in'
    fill_in 'Username', :with => @user.username
    fill_in 'Password', :with => @user.password
    click_button 'Log in'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome back'
    expect(page).to_not have_content 'Log in'
    #
  end

  it 'does not sign me in with incorrect password' do
    # login_fail(@user)
    visit '/users/sign_in'
    fill_in 'Username', :with => @user.username
    fill_in 'Password', :with => 'password1'
    click_button 'Log in'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Log in'
    expect(page).to_not have_content 'Welcome back'
    #
  end
end

describe "the logout process" do
  before :each do
    @user = create(:user)
    # login_success(@user)
    visit '/users/sign_in'
    fill_in 'Username', :with => @user.username
    fill_in 'Password', :with => @user.password
    click_button 'Log in'
    #
  end

  it 'signs me out of current session' do
    visit root_path
    click_link 'Sign out'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Sign in'
    expect(page).to_not have_content 'Welcome back'
  end
end
