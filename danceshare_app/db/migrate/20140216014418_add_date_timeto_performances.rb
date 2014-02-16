class AddDateTimetoPerformances < ActiveRecord::Migration
  def change
    change_table :performances do |t|
      t.date :date
      t.time :time
    end
  end
end
