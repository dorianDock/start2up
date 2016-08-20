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
  sequence :label_for_skill do |n|
    "My skill number #{n}"
  end
end

FactoryGirl.define do
  factory :skill do
    label :label_for_skill
  end


end

