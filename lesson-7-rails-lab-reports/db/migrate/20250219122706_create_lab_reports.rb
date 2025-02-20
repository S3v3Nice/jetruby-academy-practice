class CreateLabReports < ActiveRecord::Migration[8.0]
  def change
    create_table :lab_reports do |t|
      t.references :user
      t.string :title
      t.string :description
      t.string :grade

      t.timestamps
    end
  end
end
