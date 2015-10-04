require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before(:each) do
    @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite' }
    @user=FactoryGirl.create(:users)
    sign_in @user
  end


  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end





end
