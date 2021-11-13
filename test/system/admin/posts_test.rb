require "application_system_test_case"

class Admin::PostsTest < ApplicationSystemTestCase
  test "visiting index as an administrator" do
    new_session admin_user

    visit admin_posts_url
  
    assert_selector "h1", text: "Posts Administration"
  end

  test 'creating a post as an adminsitrator' do
    new_session admin_user

    visit new_admin_post_url

    assert_selector 'h1', text: 'New Post'

    fill_in :post_title, with: words
    fill_in_rich_text_area 'post[content]', with: paragraphs

    click_button 'Save'

    assert_success_alert
    assert_equal admin_post_url(Post.last), current_url
  end

  test 'updating a post as an administrator' do
    new_session admin_user

    visit edit_admin_post_url(post)

    assert_selector 'h1', text: 'Edit Post'

    fill_in :post_title, with: words

    click_button :Save

    assert_success_alert
    assert_equal admin_post_url(post), current_url
  end

  test 'destroying a post as an administrator' do
    new_session admin_user
    
    visit admin_post_url(post)

    click_link :Delete

    click_ok

    assert_success_alert
    assert_current_url admin_posts_url
  end

  def post
    @post ||= create :post
  end
  
end
