class CreateMaintenances < ActiveRecord::Migration[7.0]
  def change
    create_table :maintenances do |t|
      t.references :engine, null: false, foreign_key: true
      t.string :type
      t.string :city
      t.string :materials
      t.string :technician_email
      t.date :maintenance_date

      t.timestamps
    end
  end
end
