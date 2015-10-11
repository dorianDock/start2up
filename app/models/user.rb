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

end
