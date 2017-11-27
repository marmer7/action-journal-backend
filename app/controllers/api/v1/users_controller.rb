class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users, status:200
  end

  def create
    @user = User.create(username: user_params.username, password: user_params.password)
  end

  private
  def user_params
    params.permit(:username, :password)
  end
end
