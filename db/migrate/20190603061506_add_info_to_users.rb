class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :handle, :string
    add_column :users, :name, :string
    add_column :users, :bio, :string
  end
end
