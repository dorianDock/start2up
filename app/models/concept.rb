# == Schema Information
#
# Table name: concepts
#
#  id                      :integer          not null, primary key
#  title                   :string
#  associate_number        :integer
#  associate_wished_number :integer
#  concept_type_id         :integer
#  concept_status_id       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  author_id               :integer
#  content                 :string
#

class Concept < ActiveRecord::Base

  # handle authors (users)
  belongs_to :author, class_name: "User",
             foreign_key: "author_id"

  # concept types,  statuses
  belongs_to :concept_type
  belongs_to :concept_status

  # handle categories
  has_and_belongs_to_many :concept_categories,
                          join_table: "concept_category_links",
                          class_name: "ConceptCategory",
                          foreign_key: "concept_id",
                          association_foreign_key: "category_id"




end
