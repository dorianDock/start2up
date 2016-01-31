# == Schema Information
#
# Table name: user_links
#
#  id                :integer          not null, primary key
#  askerId           :integer
#  answererId        :integer
#  user_link_type_id :integer
#  isAccepted        :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class UserLink < ActiveRecord::Base
  #handle relationships
  belongs_to :user_link_type
  belongs_to :asker, class_name: "User", foreign_key: "askerId"
  belongs_to :answerer, class_name: "User", foreign_key: "answererId"

  attr_reader :acceptanceStatus
  attr_reader :displayAcceptanceMessage
  attr_reader :displayDecisionMessage

  def ask_mentoring_to(future_mentor)
    aType=UserLinkType.where(title: "Mentor").first
    self.userLinksAsked.create!(:answererId => future_mentor.id, :user_link_type_id => aType.id)
  end

  def acceptanceStatus
    if self.isAccepted?
      if self.isAccepted==true
        "Accepted"
      else
        "Refused"
      end
    else
      "Pending"
    end
  end

  def acceptanceIcons
    if self.acceptanceStatus=='Accepted'
      "fa-check"
    elsif self.acceptanceStatus=='Refused'
      "fa-times"
    elsif self.acceptanceStatus=='Pending'
      "fa-ellipsis-h"
    end
  end

  def displayAcceptanceMessage
    if self.acceptanceStatus=='Accepted'
        "A Accepte d'etre votre"
    elsif self.acceptanceStatus=='Refused'
        "A Refuse d'etre votre"
    elsif self.acceptanceStatus=='Pending'
      "N'a pas encore accepte d'etre votre"
    end
  end

  def displayDecisionMessage
    if self.acceptanceStatus=='Accepted'
      "Vous avez accepte d'etre son"
    elsif self.acceptanceStatus=='Refused'
      "Vous avez refuse d'etre son"
    elsif self.acceptanceStatus=='Pending'
      "Vous n'avez pas encore repondu"
    end
  end



end
