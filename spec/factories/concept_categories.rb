# == Schema Information
#
# Table name: concept_categories
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :concept_category do
    label "MyString"
  end

end