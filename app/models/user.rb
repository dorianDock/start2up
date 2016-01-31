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
#

class User < ActiveRecord::Base

  #handle attachments
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png",
                    url: "/system/users/:id/:style/:filename"
  validates_attachment_content_type :avatar, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  #handle relationships

  has_many :askedFriendships, :foreign_key => "askerId",
           :class_name => "FriendLink",
           :dependent => :destroy
  has_many :friendsAsked, :through => :askedFriendships, :source => :answerer
  has_many :acceptedFriendships,:foreign_key => "answererId",
           :class_name => "FriendLink",
           :dependent => :destroy
  has_many :friendsAccepted, :through => :acceptedFriendships, :source => :asker

  has_many :userLinksAsked, :foreign_key => "askerId",
           :class_name => "UserLink",
           :dependent => :destroy
  has_many :linkedUsersAsked, :through => :userLinksAsked, :source => :answerer

  has_many :userLinksAnswered, :foreign_key => "answererId",
           :class_name => "UserLink",
           :dependent => :destroy
  has_many :linkedUsersAnswered, :through => :userLinksAnswered, :source => :asker


  #handle concepts
  has_many :concepts, foreign_key: "author_id"

  #handle skills
  has_and_belongs_to_many :skills,
                          join_table: "user_skills",
                          class_name: "Skill",
                          foreign_key: "user_id",
                          association_foreign_key: "skill_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,password_length: 6..128

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # validates :nom, presence: true, :length   => { :maximum => 50 }
  validates :email, presence: true,
  :format   => { :with => email_regex },
      :uniqueness => { :case_sensitive => false }
  # password validatons
  validates :password, presence: true

  def become_friend_with(new_friend)
    self.askedFriendships.create!(:answererId => new_friend.id)
    # relationships.create!(:followed_id => followed.id)
  end

  def ask_mentoring_to(future_mentor)
    aType=UserLinkType.where(title: "Mentor").first
    self.userLinksAsked.create!(:answererId => future_mentor.id, :user_link_type_id => aType.id)
  end

  def ask_partnership_to(future_partner)
    aType=UserLinkType.where(title: "Partner")
    self.userLinksAsked.create!(:answererId => future_partner.id, :user_link_type => aType)
  end

  def accept_mentoring(a_user_link)
    aType=UserLinkType.where(title: "Mentor")
    if a_user_link.user_link_type==aType
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=true
      link_to_update.save
    end
  end

  def refuse_mentoring(a_user_link)
    aType=UserLinkType.where(title: "Mentor")
    if a_user_link.user_link_type==aType
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=false
      link_to_update.save
    end
  end

  def accept_partnership(a_user_link)
    aType=UserLinkType.where(title: "Partner")
    if a_user_link.user_link_type==aType
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=true
      link_to_update.save
    end
  end

  def refuse_partnership(a_user_link)
    aType=UserLinkType.where(title: "Partner")
    if a_user_link.user_link_type==aType
      link_to_update=UserLink.where(id: a_user_link.id)
      link_to_update.isAccepted=false
      link_to_update.save
    end
  end


end
