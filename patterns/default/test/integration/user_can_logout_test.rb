require File.join(File.dirname(__FILE__), '..', 'test_helper')

class UserCanLogoutTest < ActionController::IntegrationTest

  context 'a logged-in user' do
    setup do
#{make_user_block}
      visit login_path
      fill_in 'Login', :with => @user.login
      fill_in 'Password', :with => @user.password
      click_button 'Login'
    end
    
    should 'be able to log out' do
      visit root_path
      
      click_link "Logout"

      assert_equal new_user_session_path, path
      assert_contain "Logout successful!"
    end
  end
end
