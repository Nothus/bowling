class MatchesController < ApplicationController

  def index
    @matches = Match.all
    respond_with @matches
  end

  def create
    @match = Match.create
    players = params[:player]
    players.each do |player|
      @match.games.create(:player => player)
    end
    redirect_to match_path(@match)
  end

  def show
    @match = Match.find(params[:id])
    respond_with @match
  end

end