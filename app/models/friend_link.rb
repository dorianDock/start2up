# == Schema Information
#
# Table name: friend_links
#
#  id         :integer          not null, primary key
#  askerId    :integer
#  answererId :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class FriendLink < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "askerId"
  belongs_to :user, class_name: "User", foreign_key: "answererId"

end
