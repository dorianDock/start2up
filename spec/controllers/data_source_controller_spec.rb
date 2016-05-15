require 'rails_helper'

RSpec.describe DataSourceController, type: :controller do

  before(:each) do

    @user= FactoryGirl.create(:user)
    sign_in @user

    @skill= FactoryGirl.create(:skill)
    @category_for_useful_link= FactoryGirl.create(:useful_link_category)
    @concept_category= FactoryGirl.create(:concept_category)

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

  describe 'GET #concept_category_list' do
    it 'Categories for concepts are reached' do
      get :category_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to include('success' => true)
    end

    it 'Categories for skills are existing in the db' do
      get :category_list, format: :json
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
      get :skill_list, format: :json
      json_body= JSON.parse(response.body)
      expect(json_body).to_not include('results' => [])
    end
  end





end
