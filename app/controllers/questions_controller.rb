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
    question = Question.find(params[:id])
    # up_votes = Vote.find(question.votes)
    # down_votes = Vote.find(params[:id]).vote_for
    vote_rating = 9

    render json: {
      id: question.id,
      member_name: question.member.name,
      title: question.title,
      description: question.desc,
      date: question.reformatted_date,
      vote_rating: question.votes,
      answers: question.answers
    }
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

  def as_json()
    {id: id,
     member_id: member_id,
     title: title,
     desc: desc
    }
  end
end
