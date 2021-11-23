require 'test_helper'

class Admin::PostPolicyTest < ActiveSupport::TestCase
  setup do
    @post = create :post
    @role = create :admin_role
    @user = create :user
  end

  test 'index?' do
    assert_not pundit_policy(nil)
    assert_not pundit_policy(@user)
    
    add_user_to_role @user, @role
    @user.reload
    
    assert pundit_policy(@user)
  end

  test 'new?' do
    assert_not pundit_policy(nil)
    assert_not pundit_policy(@user)
    
    add_user_to_role @user, @role
    @user.reload
    
    assert pundit_policy(@user)
  end

  test 'create?' do
    assert_not pundit_policy(nil)
    assert_not pundit_policy(@user)
    
    add_user_to_role @user, @role
    @user.reload
    
    assert pundit_policy(@user)
  end

  test 'edit?' do
    assert_not pundit_policy(nil)
    assert_not pundit_policy(@user)
    
    add_user_to_role @user, @role
    @user.reload
    
    assert pundit_policy(@user)
  end

  test 'update?' do
    assert_not pundit_policy(nil)
    assert_not pundit_policy(@user)
    
    add_user_to_role @user, @role
    @user.reload
    
    assert pundit_policy(@user)
  end

  test 'destroy?' do
    assert_not pundit_policy(nil)
    assert_not pundit_policy(@user)
    
    add_user_to_role @user, @role
    @user.reload
    
    assert pundit_policy(@user)
  end
end
