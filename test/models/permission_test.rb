require 'test_helper'

class PermissionTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:role_id).of_type(:integer)
    should have_db_column(:user_id).of_type(:integer)
  end

  context "db indexes" do
    should have_db_index :role_id
    should have_db_index :user_id
  end
  
  context 'validations' do
    should belong_to :role
    should belong_to :user
  end
end
