class AddProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id

      t.text :about
      t.string :political_views
      t.string :religious_views
      t.string :looking_for
      t.string :interested_in

      t.text :favorite_quotes

      t.timestamps
    end

    add_index :profiles, :user_id
  end
end
