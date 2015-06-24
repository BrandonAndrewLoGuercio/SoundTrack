require 'rails_helper'

describe "submitting a new post" do
  before :each do
    @user = create(:user)
  end

  it "allows a signed in user to post" do
    login_success(@user)
    visit root_path
    click_on 'New Post'
    expect(current_path).to eq new_post_path
    fill_in 'post[message]', :with => 'new post'
    click_on 'Create Post'
    expect(page).to have_content 'Post was successfully created.'
  end

  it "redirects users who are not logged in to log in page" do
    visit root_path
    click_on 'New Post'
    expect(current_path).to eq new_user_session_path
    expect(page).to have_content 'Log in'
    expect(page).to_not have_content 'Create Post'
  end
end

describe "editing an existing post" do
  before :each do
    @user = create(:user)
    login_success(@user)
    @post = create(:post)
    # post2 = create(:post)
  end

  it "allows a signed in user to edit an existing post from show post page" do
    visit post_path(@post)
    go_to_edit_page(@post)
  end

  it "allows a signed in user to edit an existing post from user posts page" do
    visit posts_path(@user)
    click_on 'Edit', @post
    expect(current_path).to eq edit_post_path(@post)
    expect(page).to have_content 'Editing Post'
    #
  end

  it "allows a signed in user to update post" do
    visit post_path(@post)
    go_to_edit_page(@post)
    fill_in 'post[message]', :with => 'updated post'
    click_on 'Update Post'
    @post.update(:message => 'updated post')
    expect(current_path).to eq post_path(@post)
    expect(page).to have_content 'Post was successfully updated.'
  end
end