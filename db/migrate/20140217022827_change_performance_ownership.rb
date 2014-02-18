class ChangePerformanceOwnership < ActiveRecord::Migration
  def up
    add_column :performances, :company_id, :integer
  end

  def down
    remove_column :performances, :user_id
  end
end
