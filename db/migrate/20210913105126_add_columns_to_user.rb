class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string, after: :user_id
    add_column :users, :name, :string, after: :username
    add_index :users, :username, unique: true
  end
end
