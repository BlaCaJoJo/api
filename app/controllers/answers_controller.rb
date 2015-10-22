class AnswersController < ApplicationController
  def create

  end

  def index
    render json: Answer.all
  end
end
