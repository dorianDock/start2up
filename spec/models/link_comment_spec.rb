# == Schema Information
#
# Table name: link_comments
#
#  id               :integer          not null, primary key
#  body             :text
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :integer
#

require 'rails_helper'

RSpec.describe LinkComment, type: :model do

  describe 'Interactions' do
    it 'belongs to a commentable object' do
      association=described_class.reflect_on_association(:commentable)
      expect(association.macro).to eq :belongs_to
    end
    it 'belongs to a user' do
      association=described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it 'has many comments' do
      association=described_class.reflect_on_association(:comments)
      expect(association.macro).to eq :has_many
    end

  end

end
