class Api::V1::AuthController < ApplicationController
skip_before_action :authorized, only: [:create, :show]

def create
  @user = User.find_by(email: user_login_params[:email])
  if @user && @user.authenticate(user_login_params[:password])
    @token = encode_token({user_id: @user.id})
    render json: {user: @user, jwt: @token, transactions: @user.transactions}, status: :accepted
  else
    render json: {message: 'Invalid e-mail or password'}, status: :unauthorized
  end
end

def show
  if current_user
    render json: {user: current_user, transactions: current_user.transactions}
  else
    render json: {error: "not logged in"}, status: 422
  end
end

private

def user_login_params
  params.require(:user).permit(:email, :password)
end

end
