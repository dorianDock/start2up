# == Schema Information
#
# Table name: user_links
#
#  id                :integer          not null, primary key
#  askerId           :integer
#  answererId        :integer
#  user_link_type_id :integer
#  isAccepted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class UserLink < ActiveRecord::Base
  #handle relationships
  belongs_to :user_link_type
  belongs_to :asker, class_name: "User", foreign_key: "askerId"
  belongs_to :answerer, class_name: "User", foreign_key: "answererId"

end
