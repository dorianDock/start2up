FactoryGirl.define do
  factory :link_comment do
    body "MyText"
    commentable_id 1
    commentable_type "MyString"
  end
end
