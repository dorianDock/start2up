require 'rails_helper'

RSpec.describe SkillController, type: :controller do

  before(:each) do
    @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'Chaussure' }
    @user= FactoryGirl.create(:user)
    sign_in @user
  end


  # describe 'GET #skills_for_user' do
  #   it 'Skills for user are reachable' do
  #     get :skills_for_user
  #     expect(response).to have_http_status(:success)
  #   end
  # end



end
