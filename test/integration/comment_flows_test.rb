require "test_helper"

class CommentFlowsTest < ActionDispatch::IntegrationTest
  test 'as a visitor, I can create a comment via HTTP' do
    post post_comments_path(_post),
      params: {
        comment: attributes_for(:comment)
      }
    assert_response :redirect
    assert_success_notice
  end
end
