class AddPrettyDateTimetoPerformances < ActiveRecord::Migration
  def change
    change_table :performances do |t|
      t.string :pretty_date
      t.string :pretty_time
    end
  end
end
