class RemoveColumnsFromPost < ActiveRecord::Migration[6.1]
  def change
    remove_column :posts, :likes, :integer
    remove_column :posts, :comments, :integer
  end
end
