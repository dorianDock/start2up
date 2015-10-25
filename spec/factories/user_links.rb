# == Schema Information
#
# Table name: user_links
#
#  id                :integer          not null, primary key
#  askerId           :integer
#  answererId        :integer
#  user_link_type_id :integer
#  isAccepted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :user_link do
    askerId 1
answererId 1
isAccepted false
  end

end
