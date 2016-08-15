# == Schema Information
#
# Table name: concept_category_links
#
#  id          :integer          not null, primary key
#  concept_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe ConceptCategoryLink, type: :model do

  describe 'Data State' do
    before(:each) do
    end

    it 'we should have several links between categories and concepts in db' do
      expect(ConceptCategoryLink.count).to be > 3
    end

  end

end
