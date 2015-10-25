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
      # @question = Question.where("title LIKE '%?%'", params[:search])
      questions = Question.arel_table
      @question = Question.where(questions[:title].matches("%#{params[:search]}%"))

      @question = Question.where("title LIKE ?", "%#{params[:search]}%")
  end

  def index
    @questions = Question.all
    @list = []
    @questions.each do |q|
      @list << {
        member_id: q.member,
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

    render json: {
      token: @question.member.token,
      member_name: @question.member.name,
      member_id: @question.member.id,
      member_email: @question.member.email,
      question_id: @question.id,
      title: @question.title,
      description: @question.desc,
      date: @question.reformatted_date,
      vote_rating: @question.vote_rating,
      answers: @question.answer_breakdown
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
