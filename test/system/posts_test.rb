require 'application_system_test_case'

class PostsTest < ApplicationSystemTestCase
  test 'as a visitor, I can view a list of posts' do
    visit posts_url
  
    assert_selector 'h1', text: 'Blogzilla'
  end

  test 'as a visitor, I acn view a post' do
    visit post_url(_post)

    assert_selector 'h1', text: _post.title
  end
end
