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

  #handle relationships



  has_many :askedFriendships, :foreign_key => "askerId",
           :class_name => "FriendLink",
           :dependent => :destroy
  has_many :friendsAsked, :through => :askedFriendships, :source => :user
  has_many :acceptedFriendships, :foreign_key => "answeredId",
           :class_name => "FriendLink",
           :dependent => :destroy
  has_many :friendsAccepted, :through => :acceptedFriendships

  has_many :userLinksAsked, :foreign_key => "askerId",
           :class_name => "UserLink",
           :dependent => :destroy
  has_many :linkedUsersAsked, :through => :userLinksAsked

  has_many :userLinksAnswered, :foreign_key => "answererId",
           :class_name => "UserLink",
           :dependent => :destroy
  has_many :linkedUsersAnswered, :through => :userLinksAnswered




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

  # get all the mentors of the current employee
  # def mentors()
  #   aType=UserLinkType.where(title: "Mentor")
  #   mentors=current_user.linkedUsersAsked.where(:user_link_type => aType,:isAccepted => true)
  #
  # end

  # get all the users for who the current employee is a mentor
  # def mentorees()
  #
  #
  #
  # end

  # get all the partners of the current employee
  # (those who accepted when the current user asked
  # AND
  # those who asked the current user and for who the current user has accepted)
  def partners()



  end

  # get all the users who were refused by the current employee as partners
  def refused_partners()


  end

end
