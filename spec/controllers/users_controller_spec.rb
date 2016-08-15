# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  firstname              :string
#  admin                  :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'Anonymous must be authenticated to see the list of users' do
    it 'users#index asks for authenticating' do
      get :index
      expect(response).to redirect_to(:controller => 'devise/sessions', :action => 'new')
      # redirected to the sign in page
    end
    it 'users#1#followed asks for authenticating' do
      get :followed, :id => 1
      expect(response).to redirect_to(:controller => 'devise/sessions', :action => 'new')
      # redirected to the sign in page
    end
    it 'users#1#followers asks for authenticating' do
      get :followers, :id => 1
      expect(response).to redirect_to(:controller => 'devise/sessions', :action => 'new')
      # redirected to the sign in page
    end
    it 'users#1 profile show asks for authenticating' do
      get :show, :id => 1
      expect(response).to redirect_to(:controller => 'devise/sessions', :action => 'new')
      # redirected to the sign in page
    end
    it 'users#1 profile edit asks for authenticating' do
      get :edit, :id => 1
      expect(response).to redirect_to(:controller => 'devise/sessions', :action => 'new')
      # redirected to the sign in page
    end
  end

  describe 'GET main pages' do
    before(:each) do
      @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'LaTruite' }
      @user= FactoryGirl.create(:user)
      @user.save!
      sign_in @user
    end


    it 'Index is accessible after authenticating' do
      get :index
      # expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'We can show the page of a user' do
      get :show, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it 'We can show the mentors of a user' do
      get :mentors, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it 'We can show the mentorees of a user' do
      get :mentorees, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it 'We can show the followed people of a user' do
      get :followed, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it 'We can show the followers of a user' do
      get :followers, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it 'The user can edit his/her own profile' do
      get :edit, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it 'The user can edit his/her own picture' do
      get :change_profile_picture, :id => @user.id
      expect(response).to have_http_status(:success)
    end

    it 'The user cannot edit someone elses profile' do
      # the id exists in the database
      get :edit, :id => 1010
      # the page was redirected
      expect(response).to have_http_status(:redirect)
    end

    it 'The user can edit edit someone elses picture' do
      # the id exists in the database
      get :change_profile_picture, :id => 1010
      # the page was redirected
      expect(response).to have_http_status(:redirect)
    end

    it 'Editing a profile but user doesn t exist' do
      # is does not match any user
      get :edit, :id => 1
      # the page was redirected
      expect(response).to have_http_status(:redirect)
    end

    it 'Editing a picture but user doesn t exist' do
      # is does not match any user
      get :change_profile_picture, :id => 1
      # the page was redirected
      expect(response).to have_http_status(:redirect)
    end



  end

  describe 'Making an admin from a user' do
    before(:each) do
      @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'LaTruite' }
      @future_admin= FactoryGirl.create(:user)
      @future_admin.save!
      sign_in @future_admin
    end

    it 'make_an_admin_from_user should be reachable' do

      get :make_an_admin_from_user, :id => @future_admin.id
      expect(response).to redirect_to(users_path)
    end

    it 'user could be switched to an admin' do
      is_currently_admin= @future_admin.admin
      get :make_an_admin_from_user, :id => @future_admin.id
      expect(is_currently_admin).to eq(@future_admin.admin)
    end

  end

end
