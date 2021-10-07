require 'test_helper'

class RoutesTest < ActionDispatch::IntegrationTest
  test 'index route' do
    assert_equal '/', root_path
  end
end
