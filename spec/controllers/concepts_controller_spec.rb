require 'rails_helper'

RSpec.describe ConceptsController, type: :controller do

  describe "GET #add_concept_for_user" do
    it "returns http success" do
      get :add_concept_for_user
      expect(response).to have_http_status(:success)
    end
  end

end
