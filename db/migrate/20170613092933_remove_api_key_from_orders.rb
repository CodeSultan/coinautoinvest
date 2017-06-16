class RemoveApiKeyFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :api_key, :string
  end
end
