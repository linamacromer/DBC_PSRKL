class MatchesController < AdminController

  def new
    @competitors = Competitor.all
  end

  def create
    @match = Match.new(matches_params)

    if @match.save
      redirect_to calendar_index_path
    else
      @errors = @match.errors.full_messages
      @competitors = Competitor.all
      render 'new'
    end
  end

  def index
    @matches = Match.all.order(:start_time)
    render :index
  end

  def edit
    @match = Match.find(params[:id])
  end

  private

  def matches_params
    params.require(:matches).permit(:start_time_string, :competitor1_id, :competitor2_id, :location, :season)
  end

end
