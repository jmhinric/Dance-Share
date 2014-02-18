class ChangeColumnsofVenues < ActiveRecord::Migration
  def change
    change_table :venues do |t|
      t.remove :snippet_image_url_small
      t.remove :snippet_image_url_large
      t.text :image_url
    end
  end
end
