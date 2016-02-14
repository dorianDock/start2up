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

class UsefulLink < ActiveRecord::Base
  belongs_to :useful_link_category


  # def ask_mentoring_to(future_mentor)
  #   self.userLinksAsked.create!(:answererId => future_mentor.id, :user_link_type_id => LinkType::MENTOR)
  # end

end
