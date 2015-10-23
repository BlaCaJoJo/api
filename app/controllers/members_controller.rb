class MembersController < ApplicationController
  def create
      m = Member.new(name: params[:name], email: params[:email], token: params[:token], password: params[:password])
      if m.save
        render json: m
      else
        render json: m.errors
      end
    end

  def index
    render json: Member.all
  end
  
  private
  def member_params
    params.require(:question).permit(:name, :email, :password)
  end
end
