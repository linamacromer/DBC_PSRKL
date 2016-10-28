class MatchesController < ApplicationController

  def index
    @matches = Match.all.order(:start_time)
    render :index
  end
end
