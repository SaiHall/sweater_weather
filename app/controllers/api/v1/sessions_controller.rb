class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by!(email: session_params[:email].downcase)
    if user.authenticate(session_params[:password])
      render json: UserSerializer.new(user)
    else
      json_response({message: "Invalid Credentials"}, 400)
    end
  end

  private

  def session_params
    params.require(:email)
    params.require(:password)
    params.permit(:email, :password)
  end
end
