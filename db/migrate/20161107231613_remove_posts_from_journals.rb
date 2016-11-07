class RemovePostsFromJournals < ActiveRecord::Migration[5.0]
  def change
    remove_column :journals, :posts_id
  end
end
