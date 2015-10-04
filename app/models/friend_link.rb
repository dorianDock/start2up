class FriendLink < ActiveRecord::Base
  belongs_to :user, class_name: "User", foreign_key: "askerId"
  belongs_to :user, class_name: "User", foreign_key: "answererId"

end
