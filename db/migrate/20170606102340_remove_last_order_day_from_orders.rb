class RemoveLastOrderDayFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :last_order_day, :Time
  end
end
