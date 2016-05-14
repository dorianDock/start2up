require 'rails_helper'

RSpec.describe HomeController, type: :controller do


  describe 'Home is reachable without authenticating' do
    it 'Skills for user are reachable' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Authenticating user for home squares' do
    it 'Specific links of home are reachable only if authenticated' do
      @user= FactoryGirl.create(:user)
      sign_in @user
      get :good_or_bad_idea
      expect(response).to have_http_status(:success)
    end
  end


end
