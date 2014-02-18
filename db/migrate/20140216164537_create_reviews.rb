class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :review_text
      t.integer :rating
      t.references :user
      t.references :performance
      t.timestamps
    end
  end
end
