require 'rails_helper'

RSpec.describe DataSourceController, type: :controller do

  describe "GET #categoryList" do
    it "returns http success" do
      get :categoryList
      expect(response).to have_http_status(:success)
    end
  end

end
