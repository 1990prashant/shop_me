class AddUserIdInOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :user_id, :integer
    add_column :products, :user_id, :integer
  end
end
