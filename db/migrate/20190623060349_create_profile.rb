class CreateProfile < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :handle
      t.string :name
      t.string :bio
    end

    add_reference :profiles, :user, foreign_key: true, index: { unique: true }

    remove_column :users, :handle
    remove_column :users, :name
    remove_column :users, :bio

  end
end
