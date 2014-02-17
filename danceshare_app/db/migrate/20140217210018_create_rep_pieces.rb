class CreateRepPieces < ActiveRecord::Migration
  def change
    create_table :rep_pieces do |t|
      t.references :company
      t.references :piece
    end
  end
end
