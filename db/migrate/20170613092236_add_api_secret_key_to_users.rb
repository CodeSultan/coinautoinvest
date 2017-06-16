class AddApiSecretKeyToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :api_secret_key, :string
  end
end
