class GamesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:search].nil? or params[:search].blank?
      @games = policy_scope(Game)
    else
      @games = policy_scope(Game).global_search(params[:search])
    end
  end

  def show
    @game = Game.find(params[:id])
    authorize @game
  end

  def new
    @game = Game.new
    authorize @game
  end

  def create
    @game = Game.new(game_params)
    @game.user = current_user
    authorize @game
    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def edit
    @game = Game.find(params[:id])
    authorize @game
  end

  def update
    @game = Game.find(parmas[:id])
    @game.update(game_params)
    authorize @game
    redirect_to game_path
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end


  private

  def game_params
    params.require(:game).permit(:name, :description, :genre, :location, :platform, :price, :photo)
  end
end
