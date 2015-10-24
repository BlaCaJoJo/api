class VotesController < ApplicationController

  def index
    render json: Vote.all
  end

  def create
  vote = Vote.new(up_down: params[:up_down], member_id: params[:member_id], vote_for_id: params[:vote_for_id], vote_for_type: params[:vote_for_type])
    if vote.member.token == params[:token]
      if vote.save
        render json: vote
      else
        render json: vote.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def update
    vote = Vote.find(params[:id])
    if vote.member.token == params[:token]
      if vote.save
        render json: vote
      else
        render json: vote.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def destroy
    vote = Vote.find(params[:id])
    if vote.member.token == params[:token]
      if vote.destroy
        render json: "ITS HAD BEEN DECIDED"
      else
        render json: vote.errors
      end
    else
      render json: "You shall not pass"
    end
  end
end
