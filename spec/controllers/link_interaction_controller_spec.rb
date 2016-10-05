require 'rails_helper'

RSpec.describe LinkInteractionsController, type: :controller do


  describe 'Creation of link Interactions' do
    before(:each) do
      @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'LaTruite' }
      @user= FactoryGirl.create(:user)
      @user.save!
      sign_in @user
    end

    it "creates a link interaction when I pass 'already read' interaction" do
      # we create a link first
      @useful_link= FactoryGirl.create(:useful_link)
      @useful_link.save!
      request.accept = "application/json"
      link_interaction_params = { :interaction_type_id => 2, :user_id => 1010, :useful_link_id => @useful_link.id}
      expect { post :create, :link_interaction => link_interaction_params }.to change(LinkInteraction, :count).by(1)
    end

    it 'changes successfully a link interaction when I override a link interaction' do
      # we create a link first
      @useful_link= FactoryGirl.create(:useful_link)
      @useful_link.save!
      request.accept = "application/json"
      number_of_link_interactions=LinkInteraction.count
      link_interaction_params = { :interaction_type_id => 2, :user_id => @user.id, :useful_link_id => @useful_link.id}
      post :create, :link_interaction => link_interaction_params
      second_number=LinkInteraction.count
      link_interaction_params = { :interaction_type_id => 2, :user_id => @user.id, :useful_link_id => @useful_link.id}
      post :create, :link_interaction => link_interaction_params
      third_number=LinkInteraction.count
      expect(second_number-number_of_link_interactions).to eq 1
      expect(third_number-number_of_link_interactions).to eq 1
      # expect { post :create, :link_interaction => link_interaction_params }.to change(LinkInteraction, :count).by(0)
    end



  end



end
