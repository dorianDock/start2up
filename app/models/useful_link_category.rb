# == Schema Information
#
# Table name: useful_link_categories
#
#  id         :integer          not null, primary key
#  label      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UsefulLinkCategory < ActiveRecord::Base
  has_many :useful_links




end
