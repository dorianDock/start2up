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

class UsefulLink < ActiveRecord::Base

  #handle link interactions
  has_many :link_interactions

  belongs_to :useful_link_category
  has_many :comments, as: :commentable, class_name: 'LinkComment'

  validates_presence_of :title, :useful_link_category_id, :url
  validates :title, :length   => { :maximum => 100 }
  validates :is_public, inclusion: { in: [ true, false ] }

  attr_accessor :picture
  #handle attachments
  has_attached_file :picture, styles: { large: '600x600>', medium: '300x300>', thumb: '100x100>' }, default_url: '/images/:style/missing.png',
                    url: '/system/useful_links/:id/:style/:filename'
  validates_attachment_content_type :picture, content_type: %w(image/jpg image/jpeg image/png image/gif)
  # equivalent to doing: ['image/jpg','image/jpeg', ..]

  scope :public_links, -> { where(is_public: true) }
  scope :public_links_with_categories, -> { joins(:useful_link_category).where(is_public: true) }
  scope :private_links, -> { where(is_public: false) }

  scope :reverse_order, -> { order(created_at: :desc) }
  scope :natural_order, -> { order(created_at: :asc) }

  scope :law, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'Law') }
  scope :money, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'Money') }
  scope :info, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'Info') }
  scope :mentorship, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'Mentorship') }
  scope :associates, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'Associates') }
  scope :housing, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'Housing') }
  scope :ideas, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'BusinessIdea') }
  scope :technical, -> { joins(:useful_link_category).where('useful_link_categories.label' => 'Technical') }

  #we call this method to make a link public or not public
  def toggle_public
    self.is_public=!self.is_public
    self.save
  end

  # to know if the link was already read or not (it should check on the linked links interactions)
  # read or not means: read or not by the current user
  def is_already_read?(user_id)
    concerned_user_interaction= self.link_interactions.where(:user_id => user_id).first
    if concerned_user_interaction.nil?
      return false
    end
    return concerned_user_interaction.interaction_type_id==InteractionType::ALREADY_READ
  end

  def is_to_read?(user_id)
    concerned_user_interaction= self.link_interactions.where(:user_id => user_id).first
    if concerned_user_interaction.nil?
      return true
    end
    return concerned_user_interaction.interaction_type_id==InteractionType::TO_READ
  end

  def is_useless?(user_id)
    concerned_user_interaction= self.link_interactions.where(:user_id => user_id).first
    if concerned_user_interaction.nil?
      return false
    end
    return concerned_user_interaction.interaction_type_id==InteractionType::USELESS
  end

  def is_priority?(user_id)
    concerned_user_interaction= self.link_interactions.where(:user_id => user_id).first
    if concerned_user_interaction.nil?
      return false
    end
    return concerned_user_interaction.interaction_type_id==InteractionType::PRIORITY
  end


  # def ask_mentoring_to(future_mentor)
  #   self.userLinksAsked.create!(:answererId => future_mentor.id, :user_link_type_id => LinkType::MENTOR)
  # end

end
