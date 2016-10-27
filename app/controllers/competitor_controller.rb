class CompetitorController < ApplicationController
  def new
  end

  def create
    @competitor = Competitor.new(competitor_params)

    if @competitor.save
      redirect_to admin_index_path
    else
      render 'new'
    end
  end

  private

  def competitor_params
    params.require(:competitor).permit(:name)
  end

end
