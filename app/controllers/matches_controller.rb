class MatchesController < AdminController

  def index
    @matches = Match.all.order(:start_time)
    render :index
  end

  def edit
    @match = Match.find(params[:id])
  end
end
