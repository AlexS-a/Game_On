class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def show
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
    if (@user.update(user_params))
      redirect_to users_path(@user)
    else
      render 'edit'
    end
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
    params.require(:user).permit(:email, :password, :user_name)
  end

end

