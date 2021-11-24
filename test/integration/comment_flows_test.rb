require 'test_helper'

class CommentFlowsTest < ActionDispatch::IntegrationTest
  test 'as a visitor, I can create a comment via HTTP' do
    post post_comments_path(_post),
         params: {
           comment: attributes_for(:comment)
         }
    assert_response :redirect
    assert_redirected_to _post
    assert_success_notice
  end

  test 'as a visitor, I can create a comment via XHR' do
    post post_comments_path(_post), xhr: true,
                                    params: {
                                      comment: attributes_for(:comment)
                                    }
    
    assert_select '.alert-success', text: 'Comment created.'
  end
end
