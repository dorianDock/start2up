# == Schema Information
#
# Table name: link_interactions
#
#  id                  :integer          not null, primary key
#  interaction_type_id :integer
#  user_id             :integer
#  useful_link_id      :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

FactoryGirl.define do
  factory :link_interaction do
    interaction_type_id 2
    user_id 1010
    useful_link_id 1
  end
end
