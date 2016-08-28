# == Schema Information
#
# Table name: concept_types
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ConceptType, type: :model do

  describe 'Data State' do
    before(:each) do
    end

    # it 'we should have possible concept types in db' do
    #   expect(ConceptType.count).to be > 0
    # end

  end
end
