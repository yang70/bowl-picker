class BowlsController < ApplicationController
  before_action :authenticate_user!
 
  def index
    @games = Game.all
    @game_picks = {}
    @games.each do |game|
      @game_picks[game] = current_user.picks.find_by(game_id: game.id)
    end
  end
end
