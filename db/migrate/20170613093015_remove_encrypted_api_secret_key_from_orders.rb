class RemoveEncryptedApiSecretKeyFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :encrypted_api_secret_key, :string
  end
end
