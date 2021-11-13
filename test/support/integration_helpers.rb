module Support
  module IntegrationHelpers
    def requires_authentication
      raise(ArgumentError, 'Block missing. Example: requires_authentication {get edit_object_path(object)}') unless block_given?

      yield
      assert_redirected_to '/users/sign_in'
      assert_not flash[:alert].nil?
    end

    def requires_authorization
      raise ArgumentError, 'Block missing. Example: requires_authorization { get edit_object_path(object) }' unless block_given?

      yield

      assert_redirected_to root_path
      assert_not flash[:alert].nil?
    end

    def sign_in(user = create(:user))
      post '/users/sign_in', params: {
        user: {
          email: user.email,
          # double check password in factory if the following pops up:
          # Expected response to be a <3XX: redirect>, but was a <200: OK>
          password: 'somepassword'
        }
      }
      assert_response :redirect
      follow_redirect!
    end
    
    def sign_out
      delete '/users/sign_out'
    end

    def assert_success_notice
      assert flash[:success].present?
    end

    def assert_error_notice
      assert flash[:error].present?
    end
  end
end
