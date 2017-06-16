class RemoveInfoFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :info, :string
  end
end
