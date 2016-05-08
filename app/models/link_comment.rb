# == Schema Information
#
# Table name: link_comments
#
#  id               :integer          not null, primary key
#  body             :text
#  commentable_id   :integer
#  commentable_type :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  author_id        :integer
#

class LinkComment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable, class_name: 'LinkComment'

  belongs_to :user, foreign_key: 'author_id'

end
