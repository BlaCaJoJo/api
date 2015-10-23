class AnswersController < ApplicationController
  def create
  answer = Answer.new(question_id: params[:question_id], member_id: params[:member_id], desc: params[:desc], accepted: params[:accepted])
    if answer.save
      render json: answer
    else
      render json: answer.errors
    end
  end

  def index
    render json: Answer.all
  end
  # private
  # def answer_params
  #   params.require(:Answer).permit(:question_id, :member_id, :desc, :accepted)
  # end
end
