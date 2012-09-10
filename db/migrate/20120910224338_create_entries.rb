class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.integer :photo_id
      t.string :url
      t.text :correct_comment
      t.text :incorrect_comment

      t.timestamps
    end
  end
end
