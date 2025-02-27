class UpdateUsersAndLabReports < ActiveRecord::Migration[8.0]
  def change
    change_column :users, :first_name, :string, null: false, limit: 100
    change_column :users, :last_name, :string, null: false, limit: 100
    change_column :users, :email, :string, null: false, limit: 150
    add_index :users, :email, unique: true

    change_column :lab_reports, :title, :string, null: false, limit: 250
    change_column :lab_reports, :description, :string, limit: 500
    add_foreign_key :lab_reports, :users, on_delete: :nullify
  end
end
