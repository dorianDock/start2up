require 'rails_helper'

RSpec.describe 'home/index.html.erb', type: :view do


  describe 'Display correctly the page' do
    before(:each) do
      render
    end

    it 'displays the welcome message' do
      expect(rendered).to match('<p> Tout commence dans un garage: Trouvez les bons outils !</p>')
    end

    it 'renders the home/index' do
      expect(rendered).to render_template('home/index')
    end

    it 'displays the classical 8 images' do
      number_of_found_images=rendered.scan('img').size
      expect(number_of_found_images).to eq 8
    end

    it 'displays also the classical 8 links' do
      number_of_found_images=rendered.scan('<a').size
      expect(number_of_found_images).to eq 8
    end
  end

end
