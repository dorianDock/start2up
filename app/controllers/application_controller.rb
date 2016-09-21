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
    if user_signed_in?
    useful_links_available=UsefulLink.public_links_with_categories.to_a
    useful_links_already_read=current_user.links_already_read
    links_not_read=useful_links_available.reject{ |element| useful_links_already_read.include?(element.id)}

    # for each type of link. we substract the number of read link
    @links_for_ideas=links_not_read.select{ |i| i.useful_link_category.label == 'BusinessIdea'}.count
    @links_for_associates=links_not_read.select{ |i| i.useful_link_category.label == 'Associates'}.count
    @links_for_law=links_not_read.select{ |i| i.useful_link_category.label == 'Law'}.count
    @links_for_money=links_not_read.select{ |i| i.useful_link_category.label == 'Money'}.count
    @links_for_info=links_not_read.select{ |i| i.useful_link_category.label == 'Info'}.count
    @links_for_godfather=links_not_read.select{ |i| i.useful_link_category.label == 'Mentorship'}.count
    @links_for_offices=links_not_read.select{ |i| i.useful_link_category.label == 'Housing'}.count
    @links_for_technics=links_not_read.select{ |i| i.useful_link_category.label == 'Technical'}.count
    end


  end

  # useful_links_with_to_read_interaction=UsefulLink.public_links_with_categories
  #                                           .joins(:link_interactions)
  #                                      .where(link_interactions: {user_id: current_user.id})
  #                                           .where(link_interactions: {interaction_type_id: InteractionType::TO_READ})
  #                                      .includes(:useful_link_category).to_a

end
