# == Schema Information
#
# Table name: link_interactions
#
#  id                  :integer          not null, primary key
#  interaction_type_id :integer
#  user_id             :integer
#  useful_link_id      :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

require 'rails_helper'

RSpec.describe LinkInteraction, type: :model do
  describe 'Interactions' do
    it 'belongs to an interaction type' do
      association=described_class.reflect_on_association(:interaction_type)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to a user' do
      association=described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to a useful link' do
      association=described_class.reflect_on_association(:useful_link)
      expect(association.macro).to eq :belongs_to
    end

  end







  # describe 'Validation' do
  #   before(:each) do
  #     @attr = { :interaction_type_id => ApplicationController::InteractionType::TO_READ,
  #               :user_id => 1010, :useful_link_id => 0 }
  #
  #   end
  #
  #   it 'users have many link interactions' do
  #     association=described_class.reflect_on_association(:link_interactions)
  #     expect(association.macro).to eq :has_many
  #   end
  #
  # end
  #
  #
  #
  # describe 'Data State' do
  #   before(:each) do
  #     # @attr = { :email => 'truite@truite.com', :password => 'truite', :password_confirmation => 'truite', :firstname => 'Thierry', :name => 'LaTruite' }
  #     # @user= FactoryGirl.create(:user)
  #     # @user.save!
  #   end
  #
  #   it 'users have many link interactions' do
  #     association=described_class.reflect_on_association(:link_interactions)
  #     expect(association.macro).to eq :has_many
  #   end
  #
  # end

end
