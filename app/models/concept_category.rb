# == Schema Information
#
# Table name: concept_categories
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ConceptCategory < ActiveRecord::Base

  # handle categories
  has_and_belongs_to_many :concepts
end
