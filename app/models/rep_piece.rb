class Rep_Piece < ActiveRecord::Base
  belongs_to :company
  belongs_to :piece
end