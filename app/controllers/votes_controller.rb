class VotesController < ApplicationController
  def create
  vote = Vote.new(up_down: params[:up_down], member_id: params[:member_id], vote_for_id: params[:vote_for_id], vote_for_type: params[:vote_for_type])
    if vote.save
      render json: vote
    else
      render json: vote.errors
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    if vote.destroy
      render json: "ITS HAD BEEN DECIDED"
    else
      render json: vote.errors
    end
  end
end
