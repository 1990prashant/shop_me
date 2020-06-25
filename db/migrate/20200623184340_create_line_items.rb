class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :line_items do |t|
      t.integer :variant_id
      t.integer :product_id
      t.integer :item_count
      t.decimal :price

      t.timestamps
    end
  end
end
