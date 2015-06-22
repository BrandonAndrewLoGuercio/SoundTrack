require 'rails_helper'

describe "submitting a new post" do
  it "allows a signed in user to post" do
    # login_success(@user)
    visit root_path
    click_on 'New Post'
    expect(current_path).to eq new_post_path
    fill_in text_area, :with => 'new post'
    click_on 'Create Post'
    @post = Post.create(:message => 'new post', :user_id => user.id)
    expect(current_path).to eq post_path(@post)
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
    user = create(:user)
    #login_success(@user)
    @post1 = create(:post, :user_id => user.id)
    @post2 = create(:post, :user_id => user.id)
  end

  it "allows a signed in user to edit an existing post from show post page" do
    # login_success(@user)
    # post_success(@post)
    visit post_path(@post1)
    # go_to_edit_page(@post)
    click_on 'Edit'
    expect(current_path).to eq edit_post_path(@post1)
    expect(page).to have_content 'Editing Post'
    #
  end

  it "allows a signed in user to edit an existing post from user posts page" do
    # post_success(@post)
    # go_to_edit_page(@post)
    visit posts_path(user)
    # go_to_edit_page(@post)
    click_on 'Edit', @post1
    expect(current_path).to eq edit_post_path(@post1)
    expect(page).to have_content 'Editing Post'
    #
  end

  it "allows a signed in user to update post" do
  # post_success(@post1)
  # go_to_edit_page(@post1)
    fill_in text_area, :with => 'updated post'
    click_on 'Update Post'
    @post1.update(:message => 'updated post')
    expect(current_path).to eq post_path(@post1)
    expect(page).to have_content 'Post was successfully updated.'
  end
end