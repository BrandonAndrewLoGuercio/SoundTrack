require 'rails_helper'

describe "the signup process" do

  it "brings me to signup page from the homepage" do
    go_to_signup_page
    expect(current_path).to eq new_user_registration_path
    expect(page).to have_content 'Sign up'
    expect(page).to_not have_content 'Sign in'
  end

  it "signs me up with unique and valid username, email, and password" do
    go_to_signup_page
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

describe "the login process" do
  before :each do
    @user = create(:user)
  end

  it "signs me in with correct username and password" do
    login_success(@user)
  end

  it 'does not sign me in with incorrect password' do
    login_fail(@user)
  end
end

describe "the logout process" do
  before :each do
    @user = create(:user)
    login_success(@user)
  end

  it 'signs me out of current session' do
    visit root_path
    click_link 'Sign out'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Sign in'
    expect(page).to_not have_content 'Welcome back'
  end
end
