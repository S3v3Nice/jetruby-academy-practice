class FixColumnsNullability < ActiveRecord::Migration[8.0]
  def change
    change_column_null :users, :email, false
    change_column_null :users, :first_name, false
    change_column_null :users, :last_name, false

    change_column_null :lab_reports, :title, false
  end
end
