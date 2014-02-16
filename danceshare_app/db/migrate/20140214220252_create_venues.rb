class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state_code
      t.string :postal_code
      t.string :cross_streets
      t.string :country_code
      t.string :neighborhoods
      t.string :display_address
      t.string :yelp_id
      t.text :image_url
      t.text :snippet_image_url
      t.text :rating_image_url
      t.integer :review_count
    end
  end
end
