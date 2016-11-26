class RemoveReferenceFromJournals < ActiveRecord::Migration[5.0]
  def change
    remove_reference :journals, :user, foreign_key: true
  end
end
