class AddEncryptedApiKeyIvToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :encrypted_api_key_iv, :string
  end
end
