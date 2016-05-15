# == Schema Information
#
# Table name: useful_link_categories
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :useful_link_category do
    label 'MyString'
  end

end
