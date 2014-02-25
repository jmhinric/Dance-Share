# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  company_id :integer
#

class Artist < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
end
