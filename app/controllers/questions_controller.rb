class QuestionsController < ApplicationController
  def create
  end

  def index
    render json: Question.all
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
end
