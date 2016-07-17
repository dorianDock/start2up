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

class LinkInteraction < ActiveRecord::Base
  belongs_to :interaction_type, required: true
  belongs_to :user
  belongs_to :useful_link

end
