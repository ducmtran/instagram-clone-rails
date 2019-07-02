class AddPostRef < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :handle
    add_reference :posts, :user, foreign_key: true
  end
end
