class Createvideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :author
      t.string :title
      t.string :sub_title
      t.string :category
      t.string :sub_category
      t.text :url
      t.text :description

      t.references :user
      t.timestamps
    end
  end
end
