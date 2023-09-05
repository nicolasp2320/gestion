class CreateEngines < ActiveRecord::Migration[7.0]
  def change
    create_table :engines do |t|
      t.integer :type
      t.string :name
      t.text :description
      t.string :photo

      t.timestamps
    end
    add_index :engines, :name, unique: true
  end
end
