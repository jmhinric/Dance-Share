# == Schema Information
#
# Table name: rep_pieces
#
#  id         :integer          not null, primary key
#  company_id :integer
#  piece_id   :integer
#

class RepPiece < ActiveRecord::Base
  belongs_to :company
  belongs_to :piece
end
