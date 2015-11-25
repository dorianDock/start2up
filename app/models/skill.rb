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

class Skill < ActiveRecord::Base

  #handle users
  has_and_belongs_to_many :users



end


