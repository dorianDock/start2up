# == Schema Information
#
# Table name: link_interactions
#
#  id                  :integer          not null, primary key
#  interaction_type_id :integer
#  user_id             :integer
#  useful_link_id      :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class LinkInteractionsController < ApplicationController
  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
  end

  def create
    finalParams=params[:link_interaction]
    @new_link_interaction = LinkInteraction.new(permitted_parameters(finalParams))
    interaction_already_existing=LinkInteraction.select{|interaction| interaction.useful_link_id=@new_link_interaction.useful_link_id}.first

    respond_to do |format|
      unless interaction_already_existing.nil?
        interaction_already_existing.interaction_type_id=User::InteractionType::ALREADY_READ
        interaction_already_existing.save
        format.json { render json: interaction_already_existing}
      else
        if @new_link_interaction.save
          # format.html { render action: 'index' }

          format.json { render json: @new_link_interaction, status: :created, data: @new_link_interaction.id }
        else
          # format.html { render action: 'new' }
          format.json { render json: @new_link_interaction.errors, status: :unprocessable_entity }
        end
      end


    end
  end

  def destroy
  end

  protected

  def permitted_parameters(params)
    params.permit(:user_id, :useful_link_id, :interaction_type_id)

  end

end


