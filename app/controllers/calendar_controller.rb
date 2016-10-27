class CalendarController < ApplicationController
  def index
    # @matches = Match.all
    p params
    if params[:start_date] != nil
      @start_date = convert_to_date(params[:start_date])
      @end_date = @start_date.end_of_month()
      @matches = Match.where(:start_time => @start_date..@end_date)
    else
      @matches = Match.all
    end

  end

  private
    def convert_to_date(string)
      if string == "January"
        DateTime.new(2016,01)
      elsif string == "October"
        DateTime.new(2016,10)
      end
    end
end
