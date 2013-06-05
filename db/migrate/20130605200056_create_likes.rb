class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :liker_id
      t.belongs_to :likable, polymorphic: true

      t.timestamps
    end
    add_index :likes, [:liker_id, :likable_id, :likable_type]
  end
end
