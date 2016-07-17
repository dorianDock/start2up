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
  pending "add some examples to (or delete) #{__FILE__}"
end
