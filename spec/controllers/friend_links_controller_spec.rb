# == Schema Information
#
# Table name: friend_links
#
#  id         :integer          not null, primary key
#  askerId    :integer
#  answererId :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe FriendLinksController, type: :controller do

  before(:each) do
    @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'Chaussure' }
    @user= FactoryGirl.create(:user)
    sign_in @user
  end



end
