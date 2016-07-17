# == Schema Information
#
# Table name: interaction_types
#
#  id   :integer          not null, primary key
#  name :text
#

FactoryGirl.define do
  factory :interaction_type do
    name "MyText"
  end
end
