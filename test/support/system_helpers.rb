module Support
  module SystemHelpers
    def new_session(user = create(:user))
      visit new_user_session_path

      fill_in :user_email, with: user.email
      fill_in :user_password, with: 'somepassword'

      click_on 'Log in'
    end

    def delete_session(user)
      click_on user.first_name
      click_on 'Logout'
    end

    def assert_success_flash
      assert has_css? '.alert.alert-success'
      assert_not find('.alert.alert-success').text.blank?
    end

    def assert_error_flash
      assert has_css? '.alert.alert-danger'
      assert_not find('.alert.alert-danger').text.blank?
    end

    def assert_notice_flash
      assert has_css? '.alert.alert-info'
      assert_not find('.alert.alert-info').text.blank?
    end

    def assert_alert_flash
      assert has_css? '.alert.alert-warning'
      assert_not find('.alert.alert-success').text.blank?
    end

    def click_ok
      page.accept_alert
    end

    def assert_current_url(url)
      assert_equal url, current_url
    end
    
    def assert_current_path(path)
      assert_equal path, current_path
    end

    def assert_unauthorized_user
      assert_current_path root_path
      assert_alert_alert
    end
  end
end
