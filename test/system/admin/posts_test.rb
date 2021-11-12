require "application_system_test_case"

class Admin::PostsTest < ApplicationSystemTestCase
  test "visiting index as an administrator" do
    new_session admin_user

    visit admin_posts_url
  
    assert_selector "h1", text: "Posts Administration"
  end
end
