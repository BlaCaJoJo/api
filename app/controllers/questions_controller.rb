class QuestionsController < ApplicationController
  def create
  question = Question.new(member_id: params[:member_id], title: params[:title], desc: params[:desc])
    if question.member.token == params[:token]
      if question.save
        render json: question
      else
        render json: question.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def index
    render json: Question.all
  end

  def show
    render json: Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    if question.member.token == params[:token]
      if question.save
        render json: question
      else
        render json: question.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def destroy
    question = Question.find(params[:id])
    if question.member.token == params[:token]
      if question.destroy
        render json: "ITS HAD BEEN DECIDED"
      else
        render json: question.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def as_json(arg)
    {id: id,
     member_id: member_id,
     title: title,
     desc: desc
    }
  end
end
