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
    render :nothing => true
  end

end