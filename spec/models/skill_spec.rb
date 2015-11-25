# == Schema Information
#
# Table name: skills
#
#  id                :integer          not null, primary key
#  label             :string
#  skill_category_id :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'rails_helper'

RSpec.describe Skill, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
