class UsefulLinkController < ApplicationController





  def index
    @usefulLinks=UsefulLink.joins(:useful_link_category).all
    @newUsefulLink=UsefulLink.new()
  end

  def create
    useful_link = params[:useful_link]
    permitted_params=permitted_parameters(useful_link)
    newUsefulLink= UsefulLink.new(permitted_params)
    newUsefulLink.save!


    redirect_to useful_link_index_path
  end




  protected

  def permitted_parameters(params)
    params.permit(:title, :description, :useful_link_category_id)

  end

end
