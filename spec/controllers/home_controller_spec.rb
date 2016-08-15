require 'rails_helper'

RSpec.describe HomeController, type: :controller do


  describe 'Public pages can be reached by anonymous' do
    it 'home#index anonymous' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Anonymous must be authenticated to see one of the links pages' do
    it 'home#law_is_law asks for authenticating' do
      get :law_is_law
      expect(response).to have_http_status(:redirect)
      # redirected to the sign in page
    end
  end


  describe 'Authenticating user for home squares' do

    before(:each) do
      @user= FactoryGirl.create(:user)
      sign_in @user
    end

    it 'Useful links for good_or_bad_idea is reachable' do
      get :good_or_bad_idea
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for find_your_soul is reachable' do
      get :find_your_soul
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for law_is_law is reachable' do
      get :law_is_law
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for money_broke is reachable' do
      get :money_broke
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for useful_information is reachable' do
      get :useful_information
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for the_godfather is reachable' do
      get :the_godfather
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for find_your_roof is reachable' do
      get :find_your_roof
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for low_cost_consulting is reachable' do
      get :low_cost_consulting
      expect(response).to have_http_status(:success)
    end
    it 'Useful links for technical_links is reachable' do
      get :technical_links
      expect(response).to have_http_status(:success)
    end

  end





end
