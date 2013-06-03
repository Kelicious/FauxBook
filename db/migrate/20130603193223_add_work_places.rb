class AddWorkPlaces < ActiveRecord::Migration
  def change
    create_table :work_places do |t|
      t.integer :profile_id

      t.string :name
      t.string :position
      t.date :start_date 
      t.date :end_date
      t.text :description

      t.timestamps
    end

    add_index :work_places, :profile_id
  end
end
