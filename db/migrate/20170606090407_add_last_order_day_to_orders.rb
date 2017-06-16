class AddLastOrderDayToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :last_order_day, :Time
  end
end
