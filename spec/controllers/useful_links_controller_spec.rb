# == Schema Information
#
# Table name: useful_links
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  useful_link_category_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  picture_file_name       :string
#  picture_content_type    :string
#  picture_file_size       :integer
#  picture_updated_at      :datetime
#  is_public               :boolean          default(FALSE), not null
#  url                     :string
#

require 'rails_helper'

RSpec.describe UsefulLinksController, type: :controller do


  before(:each) do
    @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'Chaussure' }
    @user= FactoryGirl.create(:user)
    sign_in @user
  end


  describe 'GET #index' do
    it 'Index of useful links is reachable' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end





end
