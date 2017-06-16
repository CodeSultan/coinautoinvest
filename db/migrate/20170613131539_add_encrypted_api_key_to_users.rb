class AddEncryptedApiKeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :encrypted_api_key, :string
  end
end
