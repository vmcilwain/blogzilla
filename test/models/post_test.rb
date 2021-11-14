require 'test_helper'

class PostTest < ActiveSupport::TestCase
  context 'db columns' do
    should have_db_column(:title).of_type(:string)
                                 .with_options(null: false, default: '')
    should have_db_column(:created_by).of_type(:integer)
    should have_db_column(:updated_by).of_type(:integer)
  end

  context "db indexes" do
    should have_db_index(:title)
    should have_db_index(:created_by)
    should have_db_index(:updated_by)
  end
  

  context 'validations' do
    should validate_presence_of :title
  end
  
  context 'aassociations' do
    should belong_to(:creator).optional
    should belong_to(:updater).optional
  end
end
