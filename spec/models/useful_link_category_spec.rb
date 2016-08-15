# == Schema Information
#
# Table name: useful_link_categories
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UsefulLinkCategory, type: :model do

  describe 'Data State' do
    before(:each) do
    end

    it 'we should have possible categories for useful links in db' do
      expect(UsefulLinkCategory.count).to be > 30
    end

  end
end
