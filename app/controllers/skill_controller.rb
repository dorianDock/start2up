class SkillController < ApplicationController

  def update_user_skills

    user_id=params[:userid]
    skills=params[:skills]
    skillTable=skills.to_s.split(',')


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
        render json: {:userid => user_id, :skills => skillTable }
      }
    end
  end


end
