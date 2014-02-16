class DropTablePerformancesVenues < ActiveRecord::Migration
  def change
    drop_table :performances_venues
  end
end
