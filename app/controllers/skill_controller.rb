class SkillController < ApplicationController

  def update_user_skills

    user_id=params[:userid]
    skills=params[:skills]
    skillTable=skills.to_s.split(',')
    # we now update the skills for a user > we delete existing skills and link the new ones
    # clear at first the db
    @the_user=User.find_by(id: user_id)
    @the_user.skills.destroy_all
    # then add the new linked skills
    skillTable.each do |skill_id|
      myNewRelationship= UserSkill.create(:skill_id => skill_id, :user_id => user_id)
      myNewRelationship.save
    end
    respond_to do |format|
      format.json {
        render json: {:userid => user_id, :skills => skillTable }
      }
    end

  end

  def skills_for_user

    user_id=params[:objectid]

    # we get all the skills of the user, and we select only the ids
    @the_user=User.find_by(id: user_id)
    userSkills= @the_user.skill_ids
    # then add the new linked skills
    # skillTable.each do |skill_id|
    #   myNewRelationship= UserSkill.create(:skill_id => skill_id, :user_id => user_id)
    #   myNewRelationship.save
    # end

    # string_query=query.to_s
    # if string_query.nil? || string_query.empty?
    #   the_list=Skill.all().order(:label)
    # else
    #   the_list=Skill.all().where("label LIKE '%#{string_query}%'").order(:label)
    # end
    #
    # final_list= Array.new
    # the_list.each do |category|
    #   temp_hash= {:name => category.label, :value => category.id}
    #   final_list.push(temp_hash)
    # end

    respond_to do |format|
      format.json {
        render json: userSkills
      }
    end
  end


end
