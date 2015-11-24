# == Schema Information
#
# Table name: concepts
#
#  id                      :integer          not null, primary key
#  title                   :string
#  associate_number        :integer
#  associate_wished_number :integer
#  concept_type_id         :integer
#  concept_status_id       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  author_id               :integer
#  content                 :string
#

FactoryGirl.define do
  factory :concept do
    title "MyString"
associate_number 1
associate_wished_number 1
concept_type_id 1
concept_status_id 1
  end

end
