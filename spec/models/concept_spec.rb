# == Schema Information
#
# Table name: concepts
#
#  id                      :integer          not null, primary key
#  title                   :string
#  associate_number        :integer
#  associate_wished_number :integer
#  concept_type_id         :integer
#  concept_status_id       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  author_id               :integer
#  content                 :string
#

require 'rails_helper'

RSpec.describe Concept, type: :model do

  describe 'Interactions' do
    it 'belongs to author' do
      association=described_class.reflect_on_association(:author)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to concept type' do
      association=described_class.reflect_on_association(:concept_type)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to concept status' do
      association=described_class.reflect_on_association(:concept_status)
      expect(association.macro).to eq :belongs_to
    end
    it 'has and belongs to many concept categories' do
      association=described_class.reflect_on_association(:concept_categories)
      expect(association.macro).to eq :has_and_belongs_to_many
    end
  end

  # describe 'Interactions' do
  #   before(:each) do
  #     @user= FactoryGirl.create(:user)
  #     @user.save!
  #     @concept1=FactoryGirl.create(:concepts)
  #   end
  #
  #   it 'tells the lis' do
  #     expect(@user.skills).to contain_exactly @skill1
  #     expect(@user.skill_ids[0]).to eq @skill1.id
  #   end
  # end

end
