# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  firstname              :string
#  admin                  :boolean          default(FALSE)
#

require 'will_paginate/array'

class UsersController < ApplicationController
  def index
    @users = User.paginate(:page => params[:page],:per_page => 50)
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def edit
    @user = User.find_by id: params[:id]
    if current_user.id != @user.id
      redirect_to home_index_path
    end
  end

  def update
  end

  # def create
  #   @user = User.create( user_params )
  # end

  def change_profile_picture
    @user = User.find_by id: params[:id]
    if current_user.id != @user.id
      redirect_to home_index_path
    end
  end

  def update_profile_picture
    @user=User.find_by id: params[:id]
    trueParams=params[:user].permit(:avatar)

    if @user.update_attribute(:avatar, trueParams[:avatar])
      redirect_to show
    else
      @message=@user.errors
      render 'test'
      end
  end

  def followers
    @user = User.find_by id: params[:id]
    @users = @user.friendsAccepted.paginate(:page => params[:page])
  end

  def followed
    @user = User.find_by id: params[:id]
    @users = @user.friendsAsked.paginate(:page => params[:page])
  end

  def friends
    @user = User.find_by id: params[:id]
    friendsAcceptedByUser=@user.friendsAccepted
    friendsAskedByUser=@user.friendsAsked
    @users=(friendsAcceptedByUser+friendsAskedByUser)
    @users=@users.sort_by { |el| el.name }.paginate(:page => params[:page])
    render 'index'
  end

  # def mentorees
  #   @user = User.find(params[:id])
  #   mentor_type=UserLinkType.find_by(:title => "Mentor")
  #   @users = @user.linkedUsersAnswered.where(:userLinksAsked.isAccepted => true, :userLinksAsked.user_link_type =>  mentor_type).paginate(:page => params[:page])
  #   render 'index'
  # end

  def mentorees
      @user = User.find_by id: params[:id]
      @users = User.joins(:userLinksAsked)
                   .where('user_links.isAccepted' => true,'user_links.answererId' => @user.id)
                   .paginate(:page => params[:page])
      render 'mentorees'
  end


  def mentors
    @user = User.find_by id: params[:id]
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
