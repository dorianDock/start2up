# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
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


end
