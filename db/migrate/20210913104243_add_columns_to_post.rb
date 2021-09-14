class AddColumnsToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :likes, :integer, default: 0
    add_column :posts, :comments, :integer, default: 0
  end
end
