require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do



  describe 'Public pages can be reached by anonymous' do

    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]

    end

    it 'session#users#sign in anonymous' do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

end
