class UpdateProfile < ActiveRecord::Migration[5.2]
  def change
    change_column_null :profiles, :handle, false
    change_column_null :profiles, :name, false
    change_column_default :profiles, :bio, ""
  end
end
