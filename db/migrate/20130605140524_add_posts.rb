class AddPosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :body
      t.integer :user_id
      t.integer :author_id

      t.timestamps
    end

    add_index :posts, :user_id
    add_index :posts, :author_id
  end
end
