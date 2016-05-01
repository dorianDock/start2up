# == Schema Information
#
# Table name: user_links
#
#  id                :integer          not null, primary key
#  askerId           :integer
#  answererId        :integer
#  user_link_type_id :integer
#  isAccepted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe UserLinksController, type: :controller do

end
