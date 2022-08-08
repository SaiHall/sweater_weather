class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.create!(user_params)
    if new_user.save
      new_user.update(email: new_user[:email].downcase, api_key: SecureRandom.hex)
      render json: UserSerializer.new(new_user), status: :created
    end
  end

  private
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
