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

class FriendLinksController < ApplicationController
  def create
    @target_user = User.find(params[:friend_link][:answererId])
    current_user.become_friend_with(@target_user)
    redirect_to users_url
  end



end
