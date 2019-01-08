class UsersController < ApplicationController
  def create
    user = User.find_by name: params[:user][:name]
    if user&.authenticate(params[:user][:password])
      render json: {status: :ok, id: user.id}
    else
      render json: {status: :failed}
    end
  end
end
