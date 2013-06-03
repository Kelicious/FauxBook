class AddAttributesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, default: "", null: false
    add_column :users, :last_name, :string, default: "", null: false
    add_column :users, :gender, :string
    add_column :users, :birth_date, :date
  end
end
