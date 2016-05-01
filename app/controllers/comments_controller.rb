class CommentsController < ApplicationController

  before_action :find_commentable

  def new
    @comment=LinkComment.new
  end

  def create
    @comment=@commentable.comments.new comment_params

    if @comment.save
      redirect_to :back, notice: 'Votre commentaire a bien été pris en compte'
    else
      redirect_to :back, notice: "Votre commentaire n'a pas été enregistré"
    end
  end

  private

  def comment_params
    params.require(:link_comment).permit(:body,:commentable_id,:commentable_type)
  end

  def find_commentable
    # the commentable variable will help us to register the correct type into database
    if params[:link_comment][:commentable_type]=='UsefulLink'
      @commentable=UsefulLink.find_by id: (params[:link_comment][:commentable_id])
    end
    if params[:link_comment][:commentable_type]=='LinkComment'
      @commentable=LinkComment.find_by id: (params[:link_comment][:commentable_id])
    end
  end

end
