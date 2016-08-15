# == Schema Information
#
# Table name: user_links
#
#  id                :integer          not null, primary key
#  askerId           :integer
#  answererId        :integer
#  user_link_type_id :integer
#  isAccepted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe UserLinksController, type: :controller do

  it 'user_links#index asks for authenticating' do
    get :index
    expect(response).to redirect_to(:controller => 'devise/sessions', :action => 'new')
    # redirected to the sign in page
  end

end
