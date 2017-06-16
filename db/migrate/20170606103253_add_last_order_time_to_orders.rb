class AddLastOrderTimeToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :last_order_time, :datetime
  end
end
