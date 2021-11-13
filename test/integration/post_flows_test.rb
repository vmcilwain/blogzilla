require "test_helper"

class PostFlowsTest < ActionDispatch::IntegrationTest
  test 'as an visitor, I can view a posts' do
    get posts_path

    assert_response :success
  end

  test 'as a visitor, I can view a post' do
    get post_path(_post)

    assert_response :success
  end
end
