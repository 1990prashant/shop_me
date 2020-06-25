class CreateVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :variants do |t|
      t.string :color
      t.decimal :price
      t.integer :product_id
      t.integer :count_on_hand

      t.timestamps
    end
  end
end
