require 'rails_helper'

RSpec.describe DataSourceController, type: :controller do

  before(:each) do
    @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'Chaussure' }
    @user= FactoryGirl.create(:user)
    sign_in @user
  end

  describe 'GET #useful_link_category_list' do
    it 'Categories for useful links are reached' do
      get :useful_link_category_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to include('success' => true)
    end

    it 'Categories for useful links are existing in the db' do
      get :useful_link_category_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to_not include('results' => [])
    end

  end

  describe 'GET #category_list' do
    it 'Categories for skills are reached' do
      get :category_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to include('success' => true)
    end

    it 'Categories for skills are existing in the db' do
      get :useful_link_category_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to_not include('results' => [])
    end

  end

  describe 'GET #skill_list' do
    it 'Skills are reached' do
      get :skill_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to include('success' => true)
    end
    it 'Skills are existing in the db' do
      get :useful_link_category_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to_not include('results' => [])
    end
  end





end
