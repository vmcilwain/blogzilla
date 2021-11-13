require 'test_helper'

class Admin::PostFlowsTest < ActionDispatch::IntegrationTest
  test 'requires authentication' do
    requires_authentication { get admin_posts_path }
    requires_authentication { get admin_post_path _post }
    requires_authentication { get new_admin_post_path }
    requires_authentication { get edit_admin_post_path _post }
    requires_authentication { delete admin_post_path _post }

    requires_authentication do
      post admin_posts_path,
           params: {
             post: attributes_for(:post)
           }
    end
    
    requires_authentication do
      put admin_post_path(_post),
          params: {
            post: { title: Faker::Lorem.word }
          }
    end
  end

  test 'requires authorization' do
    sign_in

    requires_authorization { get admin_posts_path }
    requires_authorization { get admin_post_path _post }
    requires_authorization { get new_admin_post_path }
    requires_authorization { get edit_admin_post_path _post }
    requires_authorization { delete admin_post_path _post }

    requires_authorization do
      post admin_posts_path,
           params: {
             post: attributes_for(:post)
           }
    end
    
    requires_authorization do
      put admin_post_path(_post),
          params: {
            post: { title: Faker::Lorem.word }
          }
    end
  end

  test 'as an admin, I can view a posts' do
    sign_in admin_user

    get admin_posts_path

    assert_response :success
  end

  test 'as an admin, I can view a post' do
    sign_in admin_user

    get admin_post_path(_post)

    assert_response :success
  end

  test 'as an administrator, I can create a post' do
    sign_in admin_user

    get new_admin_post_path
    assert_response :success
    
    post admin_posts_path, 
         params: {
           post: attributes_for(:post)
         }
    
    p = Post.last

    assert_redirected_to admin_post_path(p)
    assert_success_notice
    assert p.creator.present?
  end

  test 'as an admin, I am told why a creating a post failed' do
    sign_in admin_user

    post admin_posts_path, 
         params: {
           post: attributes_for(:post, title: nil)
         }

    assert_response :ok
    assert_template :new
    assert_error_notice
  end

  test 'as an administrator, I can update a post' do
    sign_in admin_user

    get edit_admin_post_path(_post)
    assert_response :success

    put admin_post_path(_post),
        params: {
          post: { title: 'New Title' }
        }

    assert_response :found
    assert_redirected_to admin_post_path(_post)
    assert_success_notice
  end

  test 'as an admin, I am told why a updating a post failed' do
    sign_in admin_user

    put admin_post_path(_post), 
        params: {
          post: { content: nil }
        }

    assert_response :ok
    assert_template :edit
    assert_error_notice
  end

  test 'as an admin, I can delete a post' do
    sign_in admin_user

    delete admin_post_path(_post)

    assert_response :found
    assert_redirected_to admin_posts_path
    assert_success_notice
  end
end
