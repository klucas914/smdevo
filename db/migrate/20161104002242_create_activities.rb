class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.text :receive
      t.text :reflect
      t.text :respond
      t.references :track, foreign_key: true

      t.timestamps
    end
  end
end
