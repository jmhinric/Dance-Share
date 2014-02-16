class AddForKeytoPerformances < ActiveRecord::Migration
  def change
    change_table :performances do |t|
      t.references :venue
    end
  end
end
