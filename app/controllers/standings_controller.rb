class StandingsController < ApplicationController
  def index
    if params[:time] == "week"
      @standings = Competitor.week_standings
      @time = params[:time]
    elsif params[:time] == "all"
      @standings = Competitor.all_standings
      @time = params[:time]
    elsif params[:time] == "month"
      @standings = Competitor.month_standings
      @time = params[:time]
    else
      @standings = Competitor.season_standings
      @time = "season"
   end
  end

end
