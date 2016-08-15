# == Schema Information
#
# Table name: skills
#
#  id                :integer          not null, primary key
#  label             :string
#  skill_category_id :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Skill, type: :model do
  describe 'Data State' do
    before(:each) do
    end

    it 'we should have possible skills in db' do
      expect(Skill.count).to be > 30
    end

  end
end
