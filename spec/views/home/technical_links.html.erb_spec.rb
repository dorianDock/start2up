require 'rails_helper'

RSpec.describe 'home/technical_links.html.erb', type: :view do


  describe 'Display correctly the page' do


    before(:each) do
      @user= FactoryGirl.create(:user)
      sign_in @user
      @emptyComment=LinkComment.new
      @link_on_first_idea= FactoryGirl.create(:useful_link, is_public: true, useful_link_category_id:FakeLinkCategories::TECHNICAL)
      @link_on_first_idea.save!
      @link_on_second_idea= FactoryGirl.create(:useful_link, is_public: true, useful_link_category_id:FakeLinkCategories::TECHNICAL)
      @link_on_second_idea.save!
      @usefulLinks=UsefulLink.reverse_order.public_links.all.technical
      render
    end

    it 'renders the link_list template' do
      template1='./useful_links/_link_list'
      expect(rendered).to render_template(template1)
    end

    it 'renders the home/technical_links' do
      template2='home/technical_links'
      expect(rendered).to render_template(template2)
    end

    it 'displays correctly the small picture on the top of the page' do
      expect(rendered).to match('<div class="pictureForLinkLists">')
    end
    it 'displays correctly the title' do
      expect(rendered).to match('<h1 class="usefulLinksTitle">')
    end

    it 'displays properly a link' do
      expect(rendered).to match('<div class="item">')
      expect(rendered).to match('<div class="image">')
      expect(rendered).to match('<div class="content">')
    end

    it 'displays properly when there are two links to display' do
      number_of_found_links=rendered.scan('<div class="item">').size
      expect(number_of_found_links).to eq 2
    end

    it 'displays properly two "I read" buttons' do
      number_of_found_links=rendered.scan('<form class="ui form newlinkInteraction').size
      expect(number_of_found_links).to eq 2
    end

    it 'displays properly two Comment forms' do
      number_of_found_forms=rendered.scan('<form class="ui reply form formForComment').size
      expect(number_of_found_forms).to eq 2
    end

    it 'should not display the new link button' do
      expect(rendered).to_not match('<i class="fa fa-plus"></i> Ajouter un lien</a>')
    end

  end

  describe 'Display correctly the page for admin' do
    before(:each) do
      @user= FactoryGirl.create(:user)
      @user.toggle_admin
      @user.save!
      sign_in @user
      @emptyComment=LinkComment.new
      @usefulLinks=UsefulLink.reverse_order.public_links.all.technical
      render
    end

    it 'should display the new link button, because the user is admin' do
      expect(rendered).to match('<i class="fa fa-plus"></i> Ajouter un lien</a>')
    end
  end

  describe 'Display correctly the page when no links' do
    before(:each) do
      @user= FactoryGirl.create(:user)
      sign_in @user
      @emptyComment=LinkComment.new
      @usefulLinks=UsefulLink.reverse_order.public_links.all.technical
      render
    end

    it 'displays properly when there are no links to display' do
      number_of_found_links=rendered.scan('<div class="item">').size
      expect(number_of_found_links).to eq 0
    end

    it 'displays a specific message' do
      expect(rendered).to match('<span>Pas de liens disponibles pour')
    end

  end

end
