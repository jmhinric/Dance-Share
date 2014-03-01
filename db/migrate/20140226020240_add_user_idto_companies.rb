class AddUserIdtoCompanies < ActiveRecord::Migration
  def change
    change_table :companies do |t|
      t.references :user
    end
  end
end
