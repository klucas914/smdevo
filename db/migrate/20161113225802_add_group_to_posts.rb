class AddGroupToPosts < ActiveRecord::Migration[5.0]
  def change
    add_reference :posts, :group, foreign_key: true
  end
end
