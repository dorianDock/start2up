# == Schema Information
#
# Table name: useful_links
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  useful_link_category_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  picture_file_name       :string
#  picture_content_type    :string
#  picture_file_size       :integer
#  picture_updated_at      :datetime
#  is_public               :boolean          default(FALSE), not null
#

class UsefulLinksController < ApplicationController



  def link_list
    if current_user.admin?
      @usefulLinks=UsefulLink.joins(:useful_link_category).reverse_order.all
    else
      @usefulLinks=UsefulLink.joins(:useful_link_category).reverse_order.publicLinks
    end
    @emptyComment=LinkComment.new

    @page_title='un Test'
  end

  def index
    @usefulLinks=UsefulLink.joins(:useful_link_category).reverse_order.all
    @newUsefulLink=UsefulLink.new
  end

  def new
    @newUsefulLink=UsefulLink.new
  end


  def create
    useful_link = params[:useful_link]
    permitted_params=permitted_parameters(useful_link)
    newUsefulLink= UsefulLink.new(permitted_params)
    newUsefulLink.save!
    redirect_to useful_links_path
  end

  def update
    useful_link = UsefulLink.find(params[:useful_link][:id])
    unless(useful_link.nil?)
      permitted_params=permitted_parameters(params[:useful_link])

      unless permitted_params[:picture].nil?
        useful_link.update_attribute(:picture, permitted_params[:picture])
      end

      useful_link.update_attributes(permitted_params)
      useful_link.save
    end
    redirect_to useful_links_path
  end

  def destroy


  end


  def category_for_useful_link

    useful_link_id=params[:objectid]
    # we get all the skills of the user, and we select only the ids
    the_useful_link=UsefulLink.find_by(id: useful_link_id)
    link_category= the_useful_link.useful_link_category_id

    respond_to do |format|
      format.json {
        render json: link_category
      }
    end
  end

  protected

  def permitted_parameters(params)
    params.permit(:title, :description, :useful_link_category_id, :picture, :is_public)

  end

end
