# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  email                  :string           default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  firstname              :string
#  admin                  :boolean          default(FALSE)
#

class User < ActiveRecord::Base

  #handle attachments
  has_attached_file :avatar, styles: { large: '600x600>', medium: '300x300>', thumb: '100x100>' }, default_url: "/images/:style/missing.png",
                    url: "/system/users/:id/:style/:filename"
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  #handle relationships

  has_many :askedFriendships, :foreign_key => 'askerId',
           :class_name => 'FriendLink',
           :dependent => :destroy
  has_many :friendsAsked, :through => :askedFriendships, :source => :answerer
  has_many :acceptedFriendships,:foreign_key => 'answererId',
           :class_name => 'FriendLink',
           :dependent => :destroy
  has_many :friendsAccepted, :through => :acceptedFriendships, :source => :asker

  has_many :userLinksAsked, :foreign_key => 'askerId',
           :class_name => 'UserLink',
           :dependent => :destroy
  has_many :linkedUsersAsked, :through => :userLinksAsked, :source => :answerer

  has_many :userLinksAnswered, :foreign_key => 'answererId',
           :class_name => 'UserLink',
           :dependent => :destroy
  has_many :linkedUsersAnswered, :through => :userLinksAnswered, :source => :asker


  #handle concepts
  has_many :concepts, foreign_key: 'author_id'

  #handle skills
  has_and_belongs_to_many :skills,
                          join_table: 'user_skills',
                          class_name: 'Skill',
                          foreign_key: 'user_id',
                          association_foreign_key: 'skill_id'

  #handle comments
  has_many :link_comments, foreign_key: 'author_id'

  #handle link interactions
  has_many :link_interactions




  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,password_length: 6..128

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: true, :length   => { :maximum => 100 }
  validates :firstname, presence: true, :length   => { :maximum => 100 }
  validates :email, presence: true, :format   => { :with => email_regex }, :uniqueness => { :case_sensitive => false }
  # password validations
  # validates :password, presence: true

  module LinkType
    MENTOR =1
    PARTNER = 2
  end



  # for a specific user, take all the links he/she should still read
  # is has to be links:
  # - with no interactions attached
  # OR
  # - with interactions different than 'ALREADY_READ'
  def links_already_read
    links_concerned= []
    if self.link_interactions.any?
      links_concerned=self.link_interactions.where('interaction_type_id' => InteractionType::ALREADY_READ).to_a.map{ |i| i.useful_link_id}
    end
    links_concerned
  end

  def links_declared_as_to_read
    links_concerned= []
    if self.link_interactions.any?
      links_concerned=self.link_interactions.where('interaction_type_id' => InteractionType::TO_READ).to_a.map{ |i| i.useful_link_id}
    end
    links_concerned
  end

  # we declare that we read a specific link
  def i_read_this_link(link_id)
    if UsefulLink.exists?(:id => link_id)
      self.link_interactions.create!(:useful_link_id => link_id, :interaction_type_id => InteractionType::ALREADY_READ)
    end
  end


  def become_friend_with(new_friend)
    self.askedFriendships.create!(:answererId => new_friend.id)
    # relationships.create!(:followed_id => followed.id)
  end

  def ask_mentoring_to(future_mentor)
    self.userLinksAsked.create!(:answererId => future_mentor.id, :user_link_type_id => LinkType::MENTOR)
  end

  def ask_partnership_to(future_partner)
    self.userLinksAsked.create!(:answererId => future_partner.id, :user_link_type_id => LinkType::PARTNER)
  end

  def accept_mentoring(a_user_link)
    if a_user_link.user_link_type_id==LinkType::MENTOR
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=true
      link_to_update.save
    end
  end

  def refuse_mentoring(a_user_link)
    if a_user_link.user_link_type_id==LinkType::MENTOR
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=false
      link_to_update.save
    end
  end

  def accept_partnership(a_user_link)
    if a_user_link.user_link_type_id==LinkType::PARTNER
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=true
      link_to_update.save
    end
  end

  def refuse_partnership(a_user_link)
    if a_user_link.user_link_type_id==LinkType::PARTNER
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=false
      link_to_update.save
    end
  end

  attr_reader :mentorsCount
  attr_reader :mentoreesCount
  attr_reader :userLinksWaiting
  attr_reader :displayName

  def toggle_admin
    self.admin = !(self.admin)
  end

  def userLinksWaiting
    tempCount=0
    if self.linkedUsersAnswered.any?
      tempCount=self.linkedUsersAnswered.where('user_links.isAccepted' => nil).count
    end
    tempCount
  end

  def mentorsCount
    tempCount=0
    if self.linkedUsersAsked.any?
      tempCount=self.linkedUsersAsked.where('user_links.isAccepted' => true).count
    end
    tempCount
  end

  def mentoreesCount
    tempCount=0
    if self.linkedUsersAnswered.any?
      tempCount=self.linkedUsersAnswered.where('user_links.isAccepted' => true).count
    end
    tempCount
  end

  def displayName
    tempName=''
    unless self.firstname.nil?
      tempName+=firstname
      tempName+=' '
    end
    unless self.name.nil?
      tempName+=name
    end
    tempName
  end


end
