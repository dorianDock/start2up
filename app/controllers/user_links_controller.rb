class UserLinksController < ApplicationController

  def create
    @target_user = User.find(params[:user_link][:answererId])
    current_user.ask_mentoring_to(@target_user)
    redirect_to home_index_path
  end

  def index
    aType=UserLinkType.where(:title => "Mentor").first!
    @received_requests=UserLink.where(:user_link_type_id => aType.id, :answerer => current_user)
    @sent_requests=UserLink.where(:user_link_type_id => aType.id, :asker => current_user)
    # raw_requests=UserLink.all
    # received_requests = raw_requests.paginate(:page => params[:page],:per_page => 10)
  end

  def accept_or_refuse_request

    id=params[:id]
    isAccepted=params[:isAccepted]
    # we update the request
    @new_request=UserLink.find(id)
    @new_request.isAccepted=isAccepted
    @new_request.save


    my_html=render_to_string("_requestLine", :formats => [:html], :layout => false, :locals => {:user_link => @new_request})
    respond_to do |format|

      format.json {
        render json: {:id => id, :myBool => isAccepted, :partial_view => my_html }
      }

    end
  end


end
