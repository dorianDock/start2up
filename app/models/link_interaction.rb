class LinkInteraction < ActiveRecord::Base
  belongs_to :interaction_type, required: true
  belongs_to :user
  belongs_to :useful_link

end
