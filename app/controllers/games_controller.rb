class GamesController < ApplicationController
  def index
    @games = Game.where(name: params[:search])
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end

  private

  def game_params
    params.require(:game).permit(:name, :description, :genre, :location, :platform, :price)
  end
end
