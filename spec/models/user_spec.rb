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

require 'rails_helper'

RSpec.describe User, type: :model do
  # before doing any tests
  before(:each) do
    @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite' }
  end

  it 'should create a valid user' do
    User.create!(@attr)
  end

  it 'should reject passwords too short' do
    aPassword="a"*3
    shortPassUser = User.new(@attr.merge(:password => aPassword))
    expect(shortPassUser).to_not be_valid
  end

  it 'should accept valid emails' do
    validAdresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    validAdresses.each do |address|
      valid_email_user = User.new(@attr.merge(:email => address))
      expect(valid_email_user).to be_valid
    end
  end

  it 'shouldnt accept invalid emails' do
    invalidAdresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    invalidAdresses.each do |address|
      invalid_email_user = User.new(@attr.merge(:email => address))
      expect(invalid_email_user).to_not be_valid
    end
  end

  it "should not accepta duplicate mail" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).to_not be_valid
  end

  it 'should not accept duplicate mail in uppercase' do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge(:email => upcased_email))
    user_with_duplicate_email = User.new(@attr)
    expect(user_with_duplicate_email).to_not be_valid
  end

end
