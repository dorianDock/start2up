# encoding: utf-8
# == Schema Information
#
# Table name: concepts
#
#  id                      :integer          not null, primary key
#  title                   :string
#  associate_number        :integer
#  associate_wished_number :integer
#  concept_type_id         :integer
#  concept_status_id       :integer
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  author_id               :integer
#  content                 :string
#


class ConceptsController < ApplicationController
  def add_concept_for_user
    user_id=params[:userid]
    the_user=User.find(user_id)

    the_user.concepts.create(:title => 'Une nouvelle top idée')
    the_created_concept=Concept.last

    my_html=render_to_string('users/_editIdea', :formats => [:html], :layout => false, :locals => {:user_concept => the_created_concept})

    respond_to do |format|
      format.json {
        render json: {:partial_view => my_html, :conceptid => the_created_concept.id }
      }
    end
  end

  def remove_concept_for_user
    user_id=params[:userid]
    concept_id=params[:conceptid]
    @the_concept=Concept.find(concept_id)
    Concept.delete(@the_concept)


    response="Le concept a ete supprime"

    respond_to do |format|
      format.json {
        render json: {:message => response, :conceptid => concept_id}
      }
    end
  end

  def edit_user_concept

    concept_id=params[:concept][:id]
    categories=params[:category_ids]
    if(categories.nil?)
      categories=[""]
    end

    # we now update the concept categories for a concept > we delete existing ones and link the new ones
    # clear at first the db
    @the_concept=Concept.find_by(id: concept_id)
    @the_concept.concept_categories.destroy_all

    categories.count
    # then add the new linked skills
    categories.each do |category_id|
      if !category_id.nil? && !category_id.empty?
        myNewRelationship= ConceptCategoryLink.create(:concept_id => concept_id, :category_id => category_id)
        myNewRelationship.save
      end

    end

    @the_concept.title=params[:concept][:title]
    @the_concept.content=params[:concept][:content]
    @the_concept.associate_number=params[:concept][:associate_number]
    @the_concept.associate_wished_number=params[:concept][:associate_wished_number]
    @the_concept.save

    redirect_to  edit_user_path :id => current_user.id
    # respond_to do |format|
    #   format.json {
    #     render json: {:userid => user_id, :skills => skillTable }
    #   }
    # end


  end

  def categories_for_concepts

    concept_id=params[:objectid]
    # we get all the categories of the concept, and we select only the ids
    @the_concept=Concept.find_by(id: concept_id)
    concepts= @the_concept.concept_category_ids

    respond_to do |format|
      format.json {
        render json: concepts
      }
    end
  end

  def ask_for_concept_review
    concept_id=params[:conceptid]
    respond_to do |format|
      format.json {
        render json: {:message => response, :conceptid => concept_id}
      }
    end
  end

  def publish_concept
    concept_id=params[:conceptid]
    respond_to do |format|
      format.json {
        render json: {:message => response, :conceptid => concept_id}
      }
    end
  end




end
