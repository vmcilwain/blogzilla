ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require_relative 'support/integration_helpers'
require_relative 'support/utility_helpers'
require_relative 'support/system_helpers'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include Support::IntegrationHelpers
  include Support::UtilityHelpers
  include Support::SystemHelpers

  Shoulda::Matchers.configure do |config|
    config.integrate do |with|
      with.test_framework :minitest
      with.library :rails
    end
  end

  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...

  def add_user_to_role(user, role)
    role.users << user
  end
  
  def admin_user
    role = Role.where(name: 'Administrator').first || create(:role, name: 'administrator')
    user = create :user
    add_user_to_role user, role
    user
  end
end
