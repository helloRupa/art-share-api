class ModifyUsersTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :name, :username
    remove_column :users, :email
    add_column :users, :created_at, :datetime, null: false
    add_column :users, :updated_at, :datetime, null: false

    add_index :users, :username, unique: true
  end
end
