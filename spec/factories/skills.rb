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

FactoryGirl.define do
  factory :skill do
    label "MyString"
skill_category_id "MyString"
  end

end
