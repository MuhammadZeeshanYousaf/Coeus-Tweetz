class CreateFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :follows do |t|
      t.bigint :follower_id, foreign_key: {to_table: :user}
      t.bigint :followed_user_id, foreign_key: {to_table: :user}

      t.timestamps
    end
  end
end
