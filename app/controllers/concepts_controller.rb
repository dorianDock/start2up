# encoding: utf-8

class ConceptsController < ApplicationController
  def add_concept_for_user
    user_id=params[:userid]
    the_user=User.find(user_id)

    the_user.concepts.create(:title => "Une nouvelle idée")
    the_created_concept=Concept.last

    my_html=render_to_string("users/_editIdea", :formats => [:html], :layout => false, :locals => {:user_concept => the_created_concept})

    respond_to do |format|
      format.json {
        render json: {:partial_view => my_html }
      }
    end


  end

  def edit_user_concept
    @content= params[:concept][:content]
    title=params[:concept][:title]
    categories=params[:concept][:categories]
    wishedNumber=params[:concept][:associate_wished_number]
    associateNumber=params[:concept][:associate_number]

  end
end
