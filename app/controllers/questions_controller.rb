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

  def search
    if params[:search]

      @question = Question.where("title LIKE ?", "%#{params[:search]}%")

      @list = []
      @question.each do |q|
        @list << {
          member_id: q.member.id,
          member_name: q.member.name,
          member_email: q.member.email,
          question_id: q.id,
          title: q.title,
          description: q.desc,
          date: q.reformatted_date,
          vote_rating: q.vote_rating,
          answers: q.answer_breakdown
        }
      end
      render json: @list.sort_by { |h| h[:vote_rating]}.reverse
    end
  end

  def index
    @questions = Question.all
    @list = []
    @questions.each do |q|
      @list << {
        member_id: q.member.id,
        member_name: q.member.name,
        member_email: q.member.email,
        question_id: q.id,
        title: q.title,
        description: q.desc,
        date: q.reformatted_date,
        vote_rating: q.vote_rating,
        answers: q.answer_breakdown
      }
    end
    render json: @list
  end

  def show
    @question = Question.find(params[:id])
    render json: @question.reformat_list
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
