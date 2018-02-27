class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
  end

  def edit
  end

  def update
    if (@user.update(user_params))
      redirect_to users_path(@user)
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    redirect_to root, :notice => "Your patient has been deleted"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end

