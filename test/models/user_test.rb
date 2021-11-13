require 'test_helper'

class UserTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:first_name).of_type(:string)
                                      .with_options(null: false, default: '')
    should have_db_column(:last_name).of_type(:string)
                                     .with_options(null: false, default: '')
  end

  context 'validations' do
    should validate_presence_of :first_name
    should validate_presence_of :last_name
    should have_many(:roles).through(:permissions)
  end

  setup do
    @user = create :user
    @role = create :role
  end

  test 'should return true if user has given role' do 
    create :permission, user: @user, role: @role
    assert @user.role?(@role.name.to_sym)
  end

  test 'should return false if user does not have given role' do
    assert_not @user.role?(@role.name.to_sym)
  end
end
