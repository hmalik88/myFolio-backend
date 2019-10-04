class Api::V1::UsersController < ApplicationController
skip_before_action :authorized, only: [:create]

  def create
    @user = User.new(user_params)
    @user.balance = 5000.00
    if (@user.valid?)
      @user.save
      render json: {user: @user}, status: :created
    else
      render json: {error: 'failed to create user'}, status: :not_acceptable
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
