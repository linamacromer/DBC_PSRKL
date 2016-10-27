class CalendarController < ApplicationController
  def index
    @matches = Match.all
  end
end
