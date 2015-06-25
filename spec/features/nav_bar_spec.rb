require 'rails_helper'

describe "using the navigation bar" do
  before :each do
    @user = create(:user)
  end

  it "brings a signed in user to new post page" do
    login_success(@user)
    visit root_path
    click_on 'New Post'
    expect(current_path).to eq new_post_path
  end

  it "does not give user who isn't signed in option to post" do
    visit root_path
    expect(page).to_not have_content 'New Post'
  end

  it "brings user to welcome page" do
    visit root_path
    find('.navbar-brand').click
    expect(current_path).to eq root_path
  end

  it "allows guest or user to search for other users" do
    user1 = create(:user, :username => 'searchable')
    visit root_path
    fill_in 'Search users', :with => 'searcha'
    click_on 'Search'
    expect(page).to have_content 'searchable'
    #page.should have_css('navbar-fixed-top')
  end
end

describe "using the dropdown menu" do
  before :each do
    @user = create(:user)
    login_success(@user)
    visit root_path
  end
  it "shows dropdown menu when clicking on user avatar" do
    page.first('li.dropdown').click
    expect(current_path).to eq root_path
  end

  it 'brings user to their account page' do
    first('li.dropdown').click_link 'Profile'
    expect(current_path).to eq user_path(@user)
    expect(page).to have_content('Back to home page')
  end

  it 'brings user to their accounts settings page' do
    first('li.dropdown').click_link 'Account Settings'
    expect(current_path).to eq edit_user_registration_path(@user)
    expect(page).to have_content('Edit User')
  end

  it 'lets user sign out' do
    first('li.dropdown').click_link 'Sign out'
    expect(current_path).to eq root_path
    expect(page).to have_content('Sign in')
  end

end
