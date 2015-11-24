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


  def friends
    @user = User.find(params[:id])
    @users = @user.friendsAsked.paginate(:page => params[:page])
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




  def logout
    sign_out current_user
    redirect_to home_index_url
  end
end
