# == Schema Information
#
# Table name: user_link_types
#
#  id    :integer          not null, primary key
#  title :string
#

require 'rails_helper'

RSpec.describe UserLinkType, type: :model do

  describe 'Data State' do
    before(:each) do
    end

    it 'we should have 2 user links types in db' do
      expect(UserLinkType.count).to eq(2)
    end

  end
end
