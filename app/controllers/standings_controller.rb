class StandingsController < ApplicationController
  def index
    @standings = Competitor.all.to_a.sort_by(&:wincount).reverse
  end
end
