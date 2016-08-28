# == Schema Information
#
# Table name: interaction_types
#
#  id   :integer          not null, primary key
#  name :text
#

class InteractionType < ActiveRecord::Base

  module InteractionTypes
    TO_READ =1
    ALREADY_READ = 2
    USELESS = 3
    PRIORITY = 2
  end
end
