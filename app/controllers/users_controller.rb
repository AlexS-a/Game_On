class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    # set_user
    authorize @user
  end

  # def new
  #   @user = User.new
  #   authorize @user
  # end

  def edit
    authorize @user
  end

  def update
    @user = current_user
    @user.update(user_params)
    @user.save
    redirect_to user_path(@user)
    authorize @user
  end

  def destroy
    @user.destroy
    authorize @user
    redirect_to root_path, notice: "The user has been deleted"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:description, :photo, :photo_cache)
  end
end


