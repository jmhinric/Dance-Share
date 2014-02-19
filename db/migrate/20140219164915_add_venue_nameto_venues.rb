class AddVenueNametoVenues < ActiveRecord::Migration
  def change
    add_column :companies, :venue_name, :string
  end
end
