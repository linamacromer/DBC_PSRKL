class MatchesController < AdminController

  def new
    @competitors = Competitor.all
  end

  def create
    @match = Match.new(matches_params)

    if @match.save
      redirect_to calendar_index_path
    else
      render 'new'
    end
  end

  private

  def matches_params
    params.require(:matches).permit(:start_time_string, :competitor1_id, :competitor2_id, :location, :season)
  end

end
