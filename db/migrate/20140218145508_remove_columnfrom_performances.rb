class RemoveColumnfromPerformances < ActiveRecord::Migration
  def change
    change_table :performances do |t|
      t.remove :user_id
    end
  end
end
