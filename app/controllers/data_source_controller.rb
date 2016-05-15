class DataSourceController < ApplicationController

  # render the list of useful links categories
  def useful_link_category_list
    query=params[:query]
    string_query=query.to_s

    if string_query.nil? || string_query.empty?
      the_list=UsefulLinkCategory.all().order(:label)
    else
      the_list=UsefulLinkCategory.all().where("label ILIKE '%#{string_query}%'").order(:label)
    end

    final_list= Array.new
    the_list.each do |category|
      temp_hash= {:name => category.label, :value => category.id}
      final_list.push(temp_hash)
    end

    respond_to do |format|
      format.json {
        render json: {:success => true, :results => final_list }
      }
    end
  end

  # render the list of categories in the db
  def category_list

    query=params[:query]
    string_query=query.to_s

    if string_query.nil? || string_query.empty?
      the_list=ConceptCategory.all().order(:label)
    else
      the_list=ConceptCategory.all().where("label ILIKE '%#{string_query}%'").order(:label)
    end

    final_list= Array.new
    the_list.each do |category|
      temp_hash= {:name => category.label, :value => category.id}
      final_list.push(temp_hash)
    end

    respond_to do |format|
      format.json {
        render json: {:success => true, :results => final_list }
      }
    end
  end


  # render the list of skills in the db
  def skill_list

    query=params[:query]

    string_query=query.to_s
    if string_query.nil? || string_query.empty?
      the_list=Skill.all().order(:label)
    else
      the_list=Skill.all().where("label ILIKE '%#{string_query}%'").order(:label)
    end

    final_list= Array.new
    the_list.each do |category|
      temp_hash= {:name => category.label, :value => category.id}
      final_list.push(temp_hash)
    end

    respond_to do |format|
      format.json {
        render json: {:success => true, :results => final_list }
      }
    end
  end
end
