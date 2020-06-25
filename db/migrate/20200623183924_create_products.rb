class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.decimal :base_price

      t.timestamps
    end
  end
end
