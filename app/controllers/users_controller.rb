class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page],:per_page => 50)
  end

  def show
    @user = User.find(params[:id])

  end


  def friends
    @user = User.find(params[:id])
    @users = @user.friendsAsked.paginate(:page => params[:page])
    render 'index'
  end




  def logout
    sign_out current_user
    redirect_to home_index_url
  end
end
