class CurrentMatchController < ApplicationController

  def show
    @current_match = Match.current_match
    respond_with @curent_match
  end

end