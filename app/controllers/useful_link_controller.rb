class UsefulLinkController < ApplicationController

  def index
    @usefulLinks=UsefulLink.all
    @newUsefulLink=UsefulLink.new()
  end

  def create
    useful_link = params[:useful_link]
    newUsefulLink= UsefulLink.create!(useful_link)

    redirect_to useful_link_index_path
  end


end
