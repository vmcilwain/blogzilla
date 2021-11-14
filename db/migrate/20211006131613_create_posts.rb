class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false, default: ''
      t.integer :created_by, :updated_by
      
      t.timestamps
    end

    add_index :posts, :title
    add_index :posts, :created_by
    add_index :posts, :updated_by
  end
end
