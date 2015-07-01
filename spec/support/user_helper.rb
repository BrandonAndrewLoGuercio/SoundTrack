module UserHelper

  def login_success(user)
    visit '/users/sign_in'
    fill_in 'Login', :with => user.username
    fill_in 'Password', :with => user.password
    click_button 'Log in'
  end

  def login_fail(user)
    visit '/users/sign_in'
    fill_in 'Login', :with => user.username
    fill_in 'Password', :with => 'password1'
    click_button 'Log in'
  end

  def go_to_signup_page
    visit root_path
    click_link 'Sign Up'
  end

end