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
    params.require(:comment).permit(:body)
  end

  def find_commentable
    # the commentable variable will help us to register the correct type into database
    @commentable=LinkComment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable=UsefulLink.find_by_id(params[:link_id]) if params[:link_id]
  end

end
