class AddNametoPerformances < ActiveRecord::Migration
  def change
    add_column :performances, :title, :string
  end
end
