class AnswersController < ApplicationController
  def create
  answer = Answer.new(question_id: params[:question_id], member_id: params[:member_id], desc: params[:desc], accepted: params[:accepted])
    if answer.member.token == params[:token]
      if answer.save
        render json: answer
      else
        render json: answer.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def update
    answer = Answer.find(params[:id])
    if answer.member.token == params[:token]
      if answer.save
        render json: answer
      else
        render json: answer.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def destroy
    answer= Answer.find(params[:id])
    if answer.member.token == params[:token]
      if answer.destroy
        render json: "ITS HAD BEEN DECIDED"
      else
        render json: answer.errors
      end
    else
      render json: "You shall not pass"
    end
  end
  def show
    render json: Answer.find(params[:id])
  end

  def index
    render json: Answer.all
  end
  # private
  # def answer_params
  #   params.require(:Answer).permit(:question_id, :member_id, :desc, :accepted)
  # end
end
