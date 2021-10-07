class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.belongs_to :role
      t.belongs_to :user
      t.timestamps
    end
  end
end
