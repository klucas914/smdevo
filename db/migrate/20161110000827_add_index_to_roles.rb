class AddIndexToRoles < ActiveRecord::Migration[5.0]
  def change
    add_index :roles, :group_id
    add_index :roles, :user_id
  end
end
