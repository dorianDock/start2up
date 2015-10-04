class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]


  def index
  end


  def about
  end

  def howto
  end

  def contact
  end
end
