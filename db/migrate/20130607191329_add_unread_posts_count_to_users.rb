class AddUnreadPostsCountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :unread_posts_count, :integer, default: 0, null: false
  end
end
