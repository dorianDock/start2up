# == Schema Information
#
# Table name: concepts
#
#  id                      :integer          not null, primary key
#  title                   :string
#  associate_number        :integer
#  associate_wished_number :integer
#  concept_type_id         :integer
#  concept_status_id       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  author_id               :integer
#  content                 :string
#

require 'rails_helper'

RSpec.describe ConceptsController, type: :controller do

  describe "GET #add_concept_for_user" do
    it "returns http success" do
      get :add_concept_for_user
      expect(response).to have_http_status(:success)
    end
  end

end
