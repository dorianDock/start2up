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

  describe 'Interactions' do

    it 'has and belongs to many concepts' do
      association=described_class.reflect_on_association(:concepts)
      expect(association.macro).to eq :has_and_belongs_to_many
    end
  end
end
