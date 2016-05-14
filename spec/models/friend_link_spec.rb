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

end
