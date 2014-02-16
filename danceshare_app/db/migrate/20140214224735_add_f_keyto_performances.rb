class AddFKeytoPerformances < ActiveRecord::Migration
  def change
    change_table :performances do |t|
      t.references :user
    end
  end
end
