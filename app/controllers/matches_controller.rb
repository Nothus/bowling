class MatchesController < ApplicationController

  def index
    @matches = Match.all
    respond_with @matches
  end

end