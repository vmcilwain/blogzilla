ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require_relative 'support/integration_helpers'
require_relative 'support/utility_helpers'
require_relative 'support/system_helpers'
require_relative 'support/policy_assertions'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  include Support::IntegrationHelpers
  include Support::UtilityHelpers
  include Support::SystemHelpers
  include Pundit
  include Support::PolicyAssertions

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
end
