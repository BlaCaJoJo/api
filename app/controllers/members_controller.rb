class MembersController < ApplicationController
  def create

  end

  def index
    render json: Member.all
  end
end
