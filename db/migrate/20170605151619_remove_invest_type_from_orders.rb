class RemoveInvestTypeFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :invest_type, :boolean
  end
end
