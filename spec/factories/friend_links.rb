# == Schema Information
#
# Table name: friend_links
#
#  id         :integer          not null, primary key
#  askerId    :integer
#  answererId :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :friend_link do
    askerId 1
answererId 1
  end

end
