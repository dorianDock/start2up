class UserController < ApplicationController
  def index
  end



  def logout
    sign_out current_user
    redirect_to home_index_url
  end
end
