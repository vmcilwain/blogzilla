module Support
  module SystemHelpers
    def new_session(user=create(:user))
      visit new_user_session_path

      fill_in :user_email, with: user.email
      fill_in :user_password, with: 'somepassword'

      click_on 'Log in'
    end

    def delete_session(user)
      click_on user.first_name
      click_on 'Logout'
    end
  end
end