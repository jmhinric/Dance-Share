class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :choreographer
      t.string :title
      t.date :premiere_date
      t.text :photo_url
    end
  end
end
