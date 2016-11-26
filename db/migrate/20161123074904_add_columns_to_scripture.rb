class AddColumnsToScripture < ActiveRecord::Migration[5.0]
  def change
    add_column :scriptures, :book_name, :string
    add_column :scriptures, :chapter_id, :integer
    add_column :scriptures, :verse_id, :integer
    add_column :scriptures, :verse_text, :text
  end
end
