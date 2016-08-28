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
      expect(UsefulLinkCategory.count).to eq 8
    end

    it 'we should have possible a law Category' do
      expect(UsefulLinkCategory.where(:label => 'Law').exists?).to eq true
    end

    it 'we should have possible a Money Category' do
      expect(UsefulLinkCategory.where(:label => 'Money').exists?).to eq true
    end

    it 'we should have possible a Info Category' do
      expect(UsefulLinkCategory.where(:label => 'Info').exists?).to eq true
    end

    it 'we should have possible a Mentorship Category' do
      expect(UsefulLinkCategory.where(:label => 'Mentorship').exists?).to eq true
    end

    it 'we should have possible a Associates Category' do
      expect(UsefulLinkCategory.where(:label => 'Associates').exists?).to eq true
    end

    it 'we should have possible a Housing Category' do
      expect(UsefulLinkCategory.where(:label => 'Housing').exists?).to eq true
    end

    it 'we should have possible a BusinessIdea Category' do
      expect(UsefulLinkCategory.where(:label => 'BusinessIdea').exists?).to eq true
    end

    it 'we should have possible a Technical Category' do
      expect(UsefulLinkCategory.where(:label => 'Technical').exists?).to eq true
    end





  end
end
