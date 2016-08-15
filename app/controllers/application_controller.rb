class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!,:link_counters

  # before_filter :configure_permitted_parameters, if: :devise_controller?
  #
  # def configure_permitted_parameter
  #   devise_parameter_sanitizer.for(:update_profile_picture) { |u| u.permit(:avatar) }
  # end

  # we will initialize counters there
  def link_counters
    useful_link_number=UsefulLink.public_links_with_categories.includes(:useful_link_category).to_enum
    # Come back here after the big test fuss
    # links_already_read=current_user.links_already_read


    @links_for_ideas=useful_link_number.select{ |i| i.useful_link_category.label == 'BusinessIdea'}.count
    @links_for_associates=useful_link_number.select{ |i| i.useful_link_category.label == 'Associates'}.count




    # @links_for_law=useful_link_number.law.count
    # @links_for_money=useful_link_number.money.count
    # @links_for_info=useful_link_number.info.count
    # @links_for_godfather=useful_link_number.mentorship.count
    # @links_for_offices=useful_link_number.housing.count
    # @links_for_technics=useful_link_number.technical.count



  end

end
