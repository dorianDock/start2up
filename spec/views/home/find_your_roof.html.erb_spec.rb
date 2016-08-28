require 'rails_helper'

RSpec.describe 'home/find_your_roof.html.erb', type: :view do


  describe 'Display correctly the page' do


    before(:each) do
      @user= FactoryGirl.create(:user)
      sign_in @user
      @usefulLinks=UsefulLink.reverse_order.public_links.all.housing
      render
    end

    it 'renders the link_list template' do
      template1='./useful_links/_link_list'
      expect(rendered).to render_template(template1)
    end

    it 'renders the home/find_your_roof' do
      template2='home/find_your_roof'
      expect(rendered).to render_template(template2)
    end

    it 'displays correctly the small picture on the top of the page' do
      expect(rendered).to match('<div class="pictureForLinkLists">')
    end

  end

end
