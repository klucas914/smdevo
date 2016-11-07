class CreateRoles < ActiveRecord::Migration[5.0]
  def change
    create_table :roles do |t|
       t.integer  "group_id",   null: false
       t.integer  "user_id",    null: false
       t.integer  "role_type",  null: false
       t.datetime "created_at", null: false
       t.datetime "updated_at", null: false
    end
  end
end
