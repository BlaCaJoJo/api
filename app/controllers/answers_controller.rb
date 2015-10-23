class AnswersController < ApplicationController
  def create

  end

  def index
    render json: Answer.all
  end
  # private
  # def answer_params
  #   params.require(:Answer).permit(:question_id, :member_id, :desc, :accepted)
  # end
end
