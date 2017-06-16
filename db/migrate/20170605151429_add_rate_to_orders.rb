class AddRateToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :rate, :float
  end
end
