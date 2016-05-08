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

require 'rails_helper'

RSpec.describe LinkComment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
