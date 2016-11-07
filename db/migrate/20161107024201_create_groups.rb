class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string   "title",      null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
