class MatchesController < AdminController

  def index
    @matches = Match.all.order(:start_time)
    render :index
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @match.winner
    p @match.winner
    p params
    redirect_to @match
  end

  def show
    @match = Match.find(params[:id])
  end
end
