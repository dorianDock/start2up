# == Schema Information
#
# Table name: useful_links
#
#  id                      :integer          not null, primary key
#  title                   :string
#  description             :string
#  useful_link_category_id :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

FactoryGirl.define do
  factory :useful_links do
    title "MyString"
description "MyString"
useful_link_category_id 1
  end

end
