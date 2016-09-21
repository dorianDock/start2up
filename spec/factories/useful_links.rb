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
#  picture_file_name       :string
#  picture_content_type    :string
#  picture_file_size       :integer
#  picture_updated_at      :datetime
#  is_public               :boolean          default(FALSE), not null
#  url                     :string
#



FactoryGirl.define do
  factory :useful_link do
    title 'About something'
    description 'This is an article about something'
    useful_link_category_id 602
    is_public false
    url 'aaa.fr'
  end

end
