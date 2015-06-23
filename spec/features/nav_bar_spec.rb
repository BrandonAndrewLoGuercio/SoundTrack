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

  it "redirects users who are not logged in to log in page" do
    visit root_path
    click_on 'New Post'
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Log in'
    expect(page).to_not have_content 'Create Post'
  end

  it "brings user to welcome page" do
    click_on 'Soundtrack'
    expect(current_path).to eq root_path
  end

  it "brings signed in user to their profile page" do
    login_success(@user)
    visit root_path
    click_on @user.avatar
    expect(current_path).to eq user_path(@user)
  end

  it "allows guest or user to search for other users" do
    user1 = create(:user, :username => 'searchable')
    fill_in :search, with 'searcha'
    click_on 'Search'
    expect(page).to have_content 'searchable'
    #page.should have_css('navbar-fixed-top')
  end

end

