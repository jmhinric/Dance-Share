class CreatePerformancesVenues < ActiveRecord::Migration
  def change
    create_table :performances_venues do |t|
      t.references :performance
      t.references :venue
    end
  end
end
