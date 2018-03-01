class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @game = Game.find(params[:game_id])
    authorize @review
  end

  def create
    @review = Review.new(params_review)
    @game = Game.find(params[:game_id])
    @user = current_user
    @review.game = @game
    @review.user = @user
    authorize @review
    if @review.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to game_path(@review.game)
    authorize @review
  end

  private

  def params_review
    params.require(:review).permit(:name, :comment, :rating)
  end

end
