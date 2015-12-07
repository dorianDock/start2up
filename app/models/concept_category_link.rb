# == Schema Information
#
# Table name: concept_category_links
#
#  id          :integer          not null, primary key
#  concept_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ConceptCategoryLink < ActiveRecord::Base
end
