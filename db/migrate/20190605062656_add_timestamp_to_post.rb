class AddTimestampToPost < ActiveRecord::Migration[5.2]
  def change
    add_timestamps :posts, null: true
  end
end
