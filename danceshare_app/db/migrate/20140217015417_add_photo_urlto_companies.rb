class AddPhotoUrltoCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :photo_url, :text
  end
end
