class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.references :user_id, index: true
      t.references :asset_id, index: true

      t.timestamps null: false
    end
    add_foreign_key :carts, :user_ids
    add_foreign_key :carts, :asset_ids
  end
end
