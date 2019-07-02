class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :follower
      t.references :following
      t.timestamps
    end
  end
end
