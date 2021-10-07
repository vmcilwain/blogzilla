require "test_helper"

class Admin::PostFlowsTest < ActionDispatch::IntegrationTest
  setup do
    @post = create :post
    # @role = create :admin_role
    # @user = create :user
  end

  test "requires authentication" do
    requires_authentication { get admin_posts_path }
    requires_authentication { get admin_post_path @post }
    requires_authentication { get new_admin_post_path }
    requires_authentication { get edit_admin_post_path @post }
    requires_authentication { delete admin_post_path @post }

    # requires_authentication do
    #   post admin_categories_path,
    #     params: {
    #       category: attributes_for(:category)
    #     }
    # end
    
    # requires_authentication do
    #   put admin_category_path(@category),
    #     params: {
    #       category: { name: Faker::Lorem.word }
    #     }
    # end
  end

end
