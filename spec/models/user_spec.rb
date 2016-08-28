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

require 'rails_helper'

RSpec.describe User, type: :model do



  describe 'Validations on a user' do
    before(:each) do
      # before doing any tests
      @attr = { :email => 'truite@riviere.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'LaTruite' }
    end

    it 'should create a valid user' do
      User.create!(@attr)
    end

    it 'should reject passwords too short' do
      aPassword='a'*3
      shortPassUser = User.new(@attr.merge(:password => aPassword))
      expect(shortPassUser).to_not be_valid
    end

    it 'should not accept password with 6 characters without confirmation' do
      aPassword='a'*6
      notGoodPassUser = User.new(@attr.merge(:password => aPassword))
      expect(notGoodPassUser).to_not be_valid
    end

    it 'should accept password with 6 characters with a confirmation' do
      aPassword='a'*6
      goodPassUser = User.new(@attr.merge(:password => aPassword, :password_confirmation => aPassword))
      expect(goodPassUser).to be_valid
    end


    it 'should accept valid emails' do
      validAdresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
      validAdresses.each do |address|
        valid_email_user = User.new(@attr.merge(:email => address))
        expect(valid_email_user).to be_valid
      end
    end

    it 'should not accept invalid emails' do
      invalidAdresses = %w[user@foo,com user_at_foo.org example.user@foo.]
      invalidAdresses.each do |address|
        invalid_email_user = User.new(@attr.merge(:email => address))
        expect(invalid_email_user).to_not be_valid
      end
    end

    it 'should not accept a duplicate mail' do
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

    it 'should not accept user without regular name' do
      unknown_user = User.new(@attr.merge(:name => ''))
      expect(unknown_user).to_not be_valid
    end

    it 'should not accept user without regular firstname' do
      partially_unknown_user = User.new(@attr.merge(:firstname => ''))
      expect(partially_unknown_user).to_not be_valid
    end

    it 'should not accept a first name too long' do
      long_name='b'*120
      long_named_user = User.new(@attr.merge(:firstname => long_name))
      expect(long_named_user).to_not be_valid
    end

    it 'should not accept a name too long' do
      long_name='b'*120
      long_named_user = User.new(@attr.merge(:name => long_name))
      expect(long_named_user).to_not be_valid
    end


  end

  describe 'Associations' do
    before(:each) do
      @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'LaTruite' }
      @user= FactoryGirl.create(:user)
      @user.save!

    end

    it 'users have many link interactions' do
      association=described_class.reflect_on_association(:link_interactions)
      expect(association.macro).to eq :has_many
    end

    it 'users have many link comments' do
      association=described_class.reflect_on_association(:link_comments)
      expect(association.macro).to eq :has_many
    end

    it 'users have many concepts' do
      association=described_class.reflect_on_association(:concepts)
      expect(association.macro).to eq :has_many
    end

    it 'users have many connection askings by users' do
      association=described_class.reflect_on_association(:linkedUsersAnswered)
      expect(association.macro).to eq :has_many
    end

    it 'users have many connections asked for users' do
      association=described_class.reflect_on_association(:linkedUsersAsked)
      expect(association.macro).to eq :has_many
    end

    it 'users have many friends accepted' do
      association=described_class.reflect_on_association(:friendsAccepted)
      expect(association.macro).to eq :has_many
    end

    it 'users have many friends asked' do
      association=described_class.reflect_on_association(:friendsAsked)
      expect(association.macro).to eq :has_many
    end

    it 'users have many friends accepted' do
      association=described_class.reflect_on_association(:skills)
      expect(association.macro).to eq :has_and_belongs_to_many
    end
  end

  describe 'Quick methods' do
    before(:each) do
      @user= FactoryGirl.create(:user, :firstname =>'Thierry' ,:name=>'LaTruite')
      @user.save!

    end

    it 'display name is correct' do
      full_name=@user.displayName
      expect(full_name).to eq 'Thierry LaTruite'
    end

    it 'display name is correct if name is nil' do
      @user.firstname=nil
      full_name=@user.displayName
      expect(full_name).to eq 'LaTruite'
    end

    it 'display name is correct if firstname is nil' do
      @user.name=nil
      full_name=@user.displayName
      expect(full_name).to eq 'Thierry '
    end

    it 'display name is correct if name and first name are nil' do
      @user.firstname=nil
      @user.name=nil
      full_name=@user.displayName
      expect(full_name).to eq ''
    end

    it 'displays zero links read by default' do
      expect(@user.links_already_read).to eq []
    end

    it 'displays zero waiting requests by default' do
      expect(@user.userLinksWaiting).to eq 0
    end

    it 'displays zero mentors by default' do
      expect(@user.mentorsCount).to eq 0
    end

    it 'displays zero mentors by default' do
      expect(@user.mentoreesCount).to eq 0
    end

    it 'changes a non admin in admin when I toggle the is_admin boolean' do
      @user.toggle_admin
      expect(@user.admin?).to eq true
    end

    it 'changes an admin in non admin when I toggle the is_admin boolean again' do
      @user.toggle_admin
      @user.toggle_admin
      expect(@user.admin?).to eq false
    end

  end

  describe 'Links Interactions' do
    before(:each) do
      @user= FactoryGirl.create(:user, :firstname =>'Thierry' ,:name=>'LaTruite')
      @user.save!
    end

    it 'Does not create a link interaction if the link does not exist' do
      @user.i_read_this_link(0)
      expect(@user.link_interactions).to eq []
    end

    it 'Does create a link interaction when we provide a correct useful link' do
      @a_link=FactoryGirl.create(:useful_link, :useful_link_category_id => 609)
      @a_link.save!
      @user.i_read_this_link(@a_link.id)
      expect(LinkInteraction.exists?(:user_id => @user.id, :useful_link_id => @a_link.id)).to eq true
    end




  end


end
