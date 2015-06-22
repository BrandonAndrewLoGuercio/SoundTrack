require 'rails_helper'
RSpec.describe User do
  it 'Signs in with Facebook' do
    let! (:user) { create(:user, :with_facebook_account) }

    background do
      visit root_path
      click_link "Sign in"
      Omniauth.config.mock_auth[:facebook] = {
          provider: 'facebook',
          uid: user.facebook_account.uid,
          credentials: {
              token: 'facebook token'
          }
      }
    end

    it 'click sign in with facebook' do
      click_link 'Sign In With Facebook'

      page.should display_flash_message('Signed in successfully.')
    end
  end
end