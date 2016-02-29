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


  #handle attachments
  has_attached_file :picture, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    url: "/system/useful_links/:id/:style/:filename"
  validates_attachment_content_type :picture, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :publicLinks, -> { where(is_public: true) }
  scope :reverse_order, -> { order(created_at: :desc) }
  scope :natural_order, -> { order(created_at: :asc) }

  scope :law, -> { where(useful_link_category_id: 1) }
  scope :money, -> { where(useful_link_category_id: 2) }
  scope :info, -> { where(useful_link_category_id: 3) }
  scope :mentorship, -> { where(useful_link_category_id: 4) }
  scope :associates, -> { where(useful_link_category_id: 5) }
  scope :housing, -> { where(useful_link_category_id: 6) }
  scope :ideas, -> { where(useful_link_category_id: 7) }




  # def ask_mentoring_to(future_mentor)
  #   self.userLinksAsked.create!(:answererId => future_mentor.id, :user_link_type_id => LinkType::MENTOR)
  # end

end
