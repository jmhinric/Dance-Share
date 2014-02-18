class AddColumnstoVenues < ActiveRecord::Migration
  def change
    change_table :venues do |t|
      t.text :snippet_image_url_small
      t.text :snippet_image_url_large
      t.text :url
      t.text :full_api_data
      t.remove :image_url
    end
  end
end
