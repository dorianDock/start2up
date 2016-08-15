# == Schema Information
#
# Table name: concept_categories
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ConceptCategory, type: :model do
  describe 'Data State' do
    before(:each) do
    end

    it 'we should have possible concept categories in db' do
      expect(ConceptCategory.count).to be > 3
    end

  end
end
