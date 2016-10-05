require 'rails_helper'


RSpec.describe ApplicationHelper, type: :helper do
  describe ApplicationHelper do
    before(:each) do
    end

    describe 'custom menu links' do
      it 'creates a proper menu link (in html and css)' do
        helper_result=helper.custom_menu_link('http://google.fr','search','A cool text','cssClass',10)
        expect(helper_result).to match('<i class="icon search">')
        expect(helper_result).to match('<div class="ui labelForMenu cssClass">10</div>')
      end

      it 'creates a menu link with expected number of firsts and seconds elements' do
        helper_result=helper.custom_menu_link('http://google.fr','search','A cool text','cssClass',10,'cssClass2',15)
        expect(helper_result).to match('<div class="ui labelForMenu cssClass">10</div>')
        expect(helper_result).to match('<div class="ui labelForMenu cssClass2">15</div>')
      end
      it 'doesnt display a second menu link if no second css class is provided' do
        helper_result=helper.custom_menu_link('http://google.fr','search','A cool text','cssClass',10)
        expect(helper_result).to_not match('<div class="ui labelForMenu cssClass2">15</div>')
      end
    end
  end
end
