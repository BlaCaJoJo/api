class QuestionsController < ApplicationController
  def create
  end

  def index
    render json: Question.all
  end

  def show
    render json: Question.find(params[:id])
  end
end
