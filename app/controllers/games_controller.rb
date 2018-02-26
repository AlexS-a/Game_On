class GamesController < ApplicationController
  def index
    @games = Game.where(name: params[:search])
  end

  def show
    @game = Game.find(params[:id])
  end



end
