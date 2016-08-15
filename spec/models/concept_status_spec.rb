# == Schema Information
#
# Table name: concept_statuses
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe ConceptStatus, type: :model do
  describe 'Data State' do
    before(:each) do
    end

    it 'we should have possible concept statuses in db' do
      expect(ConceptStatus.count).to be > 0
    end

  end
end
