class RemoveEncryptedApiKeyFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :encrypted_api_key, :string
  end
end
