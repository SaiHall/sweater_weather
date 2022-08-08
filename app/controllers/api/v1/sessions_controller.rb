class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by!(email: params[:email].downcase)
    if user.authenticate(params[:password])
      render json: UserSerializer.new(user)
    else
      json_response({message: "Invalid Credentials"}, 400)
    end
  end
end
