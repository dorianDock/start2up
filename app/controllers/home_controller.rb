class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
  end

  def good_or_bad_idea
  end

  def find_your_soul
  end

  def law_is_law
  end

  def money_broke
  end

  def useful_information
  end

  def the_godfather
  end

  def find_your_roof
  end

  def low_cost_consulting
  end

  def about
  end
  def howto
  end

  def contact
  end
end
