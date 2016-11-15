class AddColumnToSelection < ActiveRecord::Migration[5.0]
  def change
    add_column :selections, :group_id, :integer
    add_column :selections, :track_id, :integer
  end
end
