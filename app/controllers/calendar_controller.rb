class CalendarController < ApplicationController
  def index
    if params[:start_date] != nil
      @start_date = convert_to_date(params[:start_date])
      @end_date = @start_date.end_of_month()
      @matches = Match.where(:start_time => @start_date..@end_date).order(:start_time)
    else
      @matches = Match.all.order(:start_time)
    end
  end

  private
    def convert_to_date(string)
      return DateTime.new(2016,10) if string == "October"
      return DateTime.new(2016,11) if string == "November"
      return DateTime.new(2016,12) if string == "December"
      return DateTime.new(2017,01) if string == "January"
      return DateTime.new(2017,01) if string == "February"
      return DateTime.new(2017,01) if string == "March"
      return DateTime.new(2017,01) if string == "April"
    end
end
