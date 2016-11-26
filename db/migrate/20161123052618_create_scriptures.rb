class CreateScriptures < ActiveRecord::Migration[5.0]
  def change
    create_table :scriptures do |t|
      t.string :verse
      t.text :passage
      t.timestamps
    end
  end
end
