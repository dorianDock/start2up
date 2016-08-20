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

  describe 'Interaction with user' do
    before(:each) do
      @user= FactoryGirl.create(:user)
      @user.save!
      @skill1=FactoryGirl.create(:skill)
      @skill2=FactoryGirl.create(:skill)
      @skill3=FactoryGirl.create(:skill)
      @interaction_between_user_and_skill=FactoryGirl.create(:user_skill,user_id:@user.id,skill_id:@skill1.id)
      @interaction_between_user_and_skill.save!
      @user.reload
    end

    it 'we can set some skills to someone' do
      expect(@user.skills).to contain_exactly @skill1
      expect(@user.skill_ids[0]).to eq @skill1.id
    end

    it 'respects relationships with user' do
        association=described_class.reflect_on_association(:users)
        expect(association.macro).to eq :has_and_belongs_to_many
    end

  end
end
