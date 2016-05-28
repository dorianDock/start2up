# encoding: utf-8 
class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
  end



  def good_or_bad_idea
    @usefulLinks=UsefulLink.reverse_order.public_links.all.ideas
    @page_title='Idées'
    build_empty_comment
  end

  def find_your_soul
    @usefulLinks=UsefulLink.reverse_order.public_links.all.associates
    @page_title="S'associer"
    build_empty_comment
  end

  def law_is_law
    @usefulLinks=UsefulLink.reverse_order.public_links.all.law
    @page_title='Le légal'
    build_empty_comment
  end

  def money_broke
    @usefulLinks=UsefulLink.reverse_order.public_links.all.money
    @page_title='Le financement'
    build_empty_comment
  end

  def useful_information
    @usefulLinks=UsefulLink.reverse_order.public_links.all.info
    @page_title='Informations Générales'
    build_empty_comment
  end

  def the_godfather
    @usefulLinks=UsefulLink.reverse_order.public_links.all.mentorship
    @page_title='Les associés'
    build_empty_comment
  end

  def find_your_roof
    @usefulLinks=UsefulLink.reverse_order.public_links.all.housing
    @page_title='Les bureaux'
    build_empty_comment
  end

  def low_cost_consulting
    @usefulLinks=UsefulLink.reverse_order.public_links.all.info
    @page_title='un Test'
    build_empty_comment
  end

  def technical_links
    @usefulLinks=UsefulLink.reverse_order.public_links.all.technical
    @page_title='Liens Techniques'
    build_empty_comment
  end


  def about
  end

  def howto
  end

  def contact
  end

  private

  def build_empty_comment
    @emptyComment=LinkComment.new
  end

end
