class RemoveVenueIdfromPerformances < ActiveRecord::Migration
  def change
    change_table :performances do |t|
      t.remove :venue_id
    end
  end
end
