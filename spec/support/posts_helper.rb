module PostHelper


  def post_success
    click_on 'New Post'
    expect(current_path).to eq new_post_path
    fill_in text_area, :with => 'new post'
    click_on 'Create Post'
    post = Post.create(:message => 'new post')
    expect(current_path).to eq post_path(post)
    expect(page).to have_content 'Post was successfully created.'
  end

  def go_to_edit_page(post)
    click_on 'Edit'
    expect(current_path).to eq edit_post_path(post)
    expect(page).to have_content 'Editing Post'
  end

end