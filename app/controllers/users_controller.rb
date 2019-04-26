class UsersController < ApplicationController
  def index
    users = nil
    if params.include?(:name)
      users = User.where('UPPER(username) LIKE UPPER(?)', "%#{params[:name]}%")
    else
      users = User.all
    end
    render json: users
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by_id(params[:id])

    if user
      render json: user
    else
      render plain: 'User does not exist'
    end
  end

  def update
    user = User.find_by_id(params[:id])

    if user.update_attributes(user_params)
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find_by_id(params[:id])
    if user.destroy
      render json: user
    else
      render plain: 'Cannot destroy user'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end