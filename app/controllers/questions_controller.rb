class QuestionsController < ApplicationController


  def index
    render json: Question.all
  end


  def create
    @question = Question.new(question_params)
    if @question.save
      render json: @question, notice:  'Question was successfully created.'
    else
      render :new
    end
  end

  def show
    render json: Question.find(params[:id])
  end

  def as_json(arg)
    {id: id,
     member_id: member_id,
     title: title,
     description: email_addresses
    }
  end

  # private
  # def question_params
  #   params.require(:member).permit(:name, :email, :desc)
  # end

end
