class AddEncryptedApiSecretKeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :encrypted_api_secret_key, :string
  end
end
