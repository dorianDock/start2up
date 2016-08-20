# == Schema Information
#
# Table name: friend_links
#
#  id         :integer          not null, primary key
#  askerId    :integer
#  answererId :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe FriendLink, type: :model do

  describe 'Interactions' do
    it 'belongs to an asker' do
      association=described_class.reflect_on_association(:asker)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to an answerer' do
      association=described_class.reflect_on_association(:answerer)
      expect(association.macro).to eq :belongs_to
    end


  end

end
