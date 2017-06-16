class RemoveApiSecretKeyFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :api_secret_key, :string
  end
end
