require 'rails_helper'

RSpec.describe SkillController, type: :controller do

  describe "GET #update_user_skills" do
    it "returns http success" do
      get :update_user_skills
      expect(response).to have_http_status(:success)
    end
  end

end
