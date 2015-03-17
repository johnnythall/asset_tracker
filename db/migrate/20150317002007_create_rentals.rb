class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.references :asset_id, index: true
      t.references :user_id, index: true
      t.references :rented_by, index: true
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps null: false
    end
    add_foreign_key :rentals, :asset_ids
    add_foreign_key :rentals, :user_ids
    add_foreign_key :rentals, :rented_bies
  end
end
