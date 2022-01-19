class AddForeignKeyToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :user_id, :integer, foreign_key: true
  end
end
