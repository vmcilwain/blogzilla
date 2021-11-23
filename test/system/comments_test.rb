require 'application_system_test_case'

class CommentsTest < ApplicationSystemTestCase
  test 'as a visitor, I can create a comment on a post' do
    text = paragraphs

    visit post_path(_post)

    fill_in :comment_name, with: Faker::Name.name
    fill_in_rich_text_area 'comment[content]', with: text

    click_button :Save
    assert page.has_css?('.trix-content')
  end
end
