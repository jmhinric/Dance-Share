class CreateRuns < ActiveRecord::Migration
  def change
    create_table :runs do |t|
      t.string :title
      t.references :company
      t.references :venue
    end
  end
end
