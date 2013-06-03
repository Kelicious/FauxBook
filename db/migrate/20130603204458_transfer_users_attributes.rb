class TransferUsersAttributes < ActiveRecord::Migration
  def change
    remove_column :users, :first_name
    remove_column :users, :last_name
    remove_column :users, :gender
    remove_column :users, :birth_date

    add_column :profiles, :first_name, :string, default: "", null: false
    add_column :profiles, :last_name, :string, default: "", null: false
    add_column :profiles, :gender, :string
    add_column :profiles, :birth_date, :date
  end
end
