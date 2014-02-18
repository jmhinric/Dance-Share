class RenamePerformancesVenues < ActiveRecord::Migration
  def up
    create_table :concerts do |t|
      t.references :venue
      t.references :performance
    end
  end

  def down
    drop_table :performances_venues
  end
end
