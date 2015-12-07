# == Schema Information
#
# Table name: concept_category_links
#
#  id          :integer          not null, primary key
#  concept_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :concept_category_link do
    concept_id 1
category_id 1
  end

end
