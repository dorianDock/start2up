class FriendLinksController < ApplicationController
  def create
    @target_user = User.find(params[:friend_link][:answererId])
    current_user.become_friend_with(@target_user)
    redirect_to users_url
  end

end
