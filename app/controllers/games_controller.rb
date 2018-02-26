class GamesController < ApplicationController
  def index
    @games = Game.search(params[:search])
  end
end
