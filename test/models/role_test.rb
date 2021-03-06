require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:name).of_type(:string).with_options(null: false, default: '')
    should have_db_column(:description).of_type(:string)

    should have_db_index :name
  end

  context 'validations' do
    should validate_presence_of :name
    should validate_uniqueness_of(:name).ignoring_case_sensitivity
    should have_many(:users).through(:permissions)
  end
  
end
