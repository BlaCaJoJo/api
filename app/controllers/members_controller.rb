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

  def update
    member = Member.find(params[:id])
    if member.token == params[:token]
      if member.save
        render json: member
      else
        render json: member.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  def destroy
    member = Member.find(params[:id])
    if member.token == params[:token]
      if member.destroy
        render json: "ITS HAD BEEN DECIDED"
      else
        render json: member.errors
      end
    else
      render json: "You shall not pass"
    end
  end

  private
  def member_params
    params.require(:member).permit(:name, :email, :password)
  end
end
