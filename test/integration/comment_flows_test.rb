require "test_helper"

class CommentFlowsTest < ActionDispatch::IntegrationTest
  test 'as a visitor, I can create a comment' do
    post comments_path,
      params: {
        comment: attributes_for(:comment)
      }
  end
end
