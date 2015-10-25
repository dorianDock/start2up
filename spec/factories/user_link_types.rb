# == Schema Information
#
# Table name: user_link_types
#
#  id    :integer          not null, primary key
#  title :string
#

FactoryGirl.define do
  factory :user_link_type do
    title "MyString"
  end

end
