class DataSourceController < ApplicationController

  # render the list of categories in the db
  def category_list

    query=params[:query]
    myString=String.new()

    string_query=query.to_s
    if(string_query.nil? || string_query.empty?)
      the_list=ConceptCategory.all().order(:label)
    else
      the_list=ConceptCategory.all().where("label LIKE '%#{string_query}%'").order(:label)
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
