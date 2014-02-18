class CreateDanceCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :admin_id
    end

    create_table :artists do |t|
      t.references :user
      t.references :company
    end

    drop_table :concerts
    drop_table :performances_venues
  end
end
