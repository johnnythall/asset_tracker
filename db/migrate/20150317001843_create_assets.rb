class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :barcode
      t.string :name
      t.text :description
      t.references :category, index: true
      t.integer :location
      t.integer :value
      t.integer :access_level
      t.boolean :available

      t.timestamps null: false
    end
    add_foreign_key :assets, :categories
  end
end
