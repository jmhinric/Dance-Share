class ChangePerformances < ActiveRecord::Migration
  def up
    add_column :performances, :run_id, :integer
  end

  def down
    remove_column :performances, :venue_id
    remove_column :performances, :company_id
  end
end
