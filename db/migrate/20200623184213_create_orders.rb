class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.decimal :order_total
      t.string :status

      t.timestamps
    end
  end
end
