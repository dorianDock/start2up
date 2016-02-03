require 'will_paginate/array'

class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page],:per_page => 50)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  # def create
  #   @user = User.create( user_params )
  # end


  def update_profile_picture
    @user=User.find(params[:id])
    trueParams=params[:user].permit(:avatar)

    if @user.update_attribute(:avatar, trueParams[:avatar])
      redirect_to show
    else
      @message=@user.errors
      render 'test'
      end
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.friendsAccepted.paginate(:page => params[:page])
    render 'index'
  end

  def followed
    @user = User.find(params[:id])
    @users = @user.friendsAsked.paginate(:page => params[:page])
    render 'index'
  end

  def friends
    @user = User.find(params[:id])
    # @users = @user.friendsAccepted.paginate(:page => params[:page])
    # @users += @user.friendsAsked.paginate(:page => params[:page])
    friendsAcceptedByUser=@user.friendsAccepted
    friendsAskedByUser=@user.friendsAsked
    @users=(friendsAcceptedByUser+friendsAskedByUser)
    @users=@users.sort_by { |el| el.name }
    .paginate(:page => params[:page])
    render 'index'
  end

  # def mentorees
  #   @user = User.find(params[:id])
  #   mentor_type=UserLinkType.find_by(:title => "Mentor")
  #   @users = @user.linkedUsersAnswered.where(:userLinksAsked.isAccepted => true, :userLinksAsked.user_link_type =>  mentor_type).paginate(:page => params[:page])
  #   render 'index'
  # end

  def mentorees
      @user = User.find(params[:id])
      @users = User.joins(:userLinksAsked)
                   .where('user_links.isAccepted' => true,'user_links.answererId' => @user.id)
                   .paginate(:page => params[:page])
      render 'mentorees'
  end


  def mentors
    @user = User.find(params[:id])
    @users = User.joins(:userLinksAnswered)
                 .where('user_links.isAccepted' => true,'user_links.askerId' => @user.id)
                 .paginate(:page => params[:page])
    render 'mentors'
  end




  # def requests
  #   @user = User.find(params[:id])
  #   @users = @user.friendsAsked.paginate(:page => params[:page])
  #   render 'user_links/index'
  # end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.

  def user_params
    params.require(:user).permit(:avatar, :name)
  end


  def logout
    sign_out current_user
    redirect_to home_index_url
  end
end
