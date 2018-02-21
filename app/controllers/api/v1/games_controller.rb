class Api::V1::GamesController < ApplicationController 
  def index 
    render json: Game.all
  end
  def show 
    render json: Game.find(params[:id])
  end
  def create 
    render json: Game.create(game_params)
  end

  private 
    def game_params
      params.require(:game).permit(:player_1_id, :player_2_id)
    end
end