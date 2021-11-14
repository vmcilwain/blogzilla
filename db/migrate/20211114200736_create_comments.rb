class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.integer :created_by, :updated_by
      t.timestamps
    end
    add_index :comments, :created_by
    add_index :comments, :updated_by
  end
end
