require 'rails_helper'


feature "the login process" do
  before :each do
    @user = create(:user)
  end

  it "signs me in with correct username and password" do
    visit '/users/sign_in'
      fill_in 'Username', :with => @user.username
      fill_in 'Password', :with => @user.password
      click_button 'Log in'
    expect(current_path).to eq root_path
    expect(page).to have_content 'Welcome back'
    expect(page).to_not have_content 'Sign in'
  end

  it 'does not sign me in with incorrect password' do
    visit '/users/sign_in'
      fill_in 'Username', :with => @user.username
      fill_in 'Password', :with => 'password1'
      click_button 'Log in'
    expect(current_path).to eq '/users/sign_in'
    expect(page).to have_content 'Log in'
    expect(page).to_not have_content 'Welcome back'
  end
end

# feature "the logout process" do
#   before :each do
#     @user = create(:user)
#     @user.sign_in
#   end
#
#   it 'signs me out of current session' do
#     visit root_page
#     click_link 'Sign out'
#     expect(current_path).to eq root_page
#     expect(page).to have_content 'Log in'
#     expect(page).to_not have_content 'Welcome back'
#   end
# end
