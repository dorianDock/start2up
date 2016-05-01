class LinkComment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, class_name: 'LinkComment'
end
