require "test_helper"

class CommentTest < ActiveSupport::TestCase
  context "db columns" do
    should have_db_column(:created_by).of_type(:integer)
    should have_db_column(:updated_by).of_type(:integer)
  end

  context "db indexes" do
    should have_db_index(:created_by)
    should have_db_index(:updated_by)
  end
  
  
  context "validates" do
    should validate_presence_of :content
  end

  context "associations" do
    should belong_to(:creator).optional
    should belong_to(:updater).optional
  end
end
