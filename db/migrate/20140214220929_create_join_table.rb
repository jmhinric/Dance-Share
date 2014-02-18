class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :performances, :venues
  end
end
