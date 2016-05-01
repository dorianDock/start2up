# == Schema Information
#
# Table name: link_comments
#
#  id               :integer          not null, primary key
#  body             :text
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

FactoryGirl.define do
  factory :link_comment do
    body "MyText"
    commentable_id 1
    commentable_type "MyString"
  end
end
