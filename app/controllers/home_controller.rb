# encoding: utf-8 
class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
  end



  def good_or_bad_idea
    @usefulLinks=UsefulLink.reverse_order.all.ideas
    @page_title='Idées'
    render "useful_link/link_list"
  end

  def find_your_soul
    @usefulLinks=UsefulLink.reverse_order.all.associates
    @page_title="S'associer"
    render "useful_link/link_list"
  end

  def law_is_law
    @usefulLinks=UsefulLink.reverse_order.all.law
    @page_title="Le légal"
    render "useful_link/link_list"
  end

  def money_broke
    @usefulLinks=UsefulLink.reverse_order.all.money
    @page_title='Le financement'
    render "useful_link/link_list"
  end

  def useful_information
    @usefulLinks=UsefulLink.reverse_order.all.info
    @page_title='Informations Générales'
    render "useful_link/link_list"
  end

  def the_godfather
    @usefulLinks=UsefulLink.reverse_order.all.mentorship
    @page_title='Les associés'
    render "useful_link/link_list"
  end

  def find_your_roof
    @usefulLinks=UsefulLink.reverse_order.all.housing
    @page_title='Les bureaux'
    render "useful_link/link_list"
  end

  def low_cost_consulting
    @usefulLinks=UsefulLink.reverse_order.all.info
    @page_title='un Test'
    render "useful_link/link_list"
  end

  def about
  end
  def howto
  end

  def contact
  end
end
