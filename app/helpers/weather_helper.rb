require "date"
require "httparty"
require "time"
require "json"

module WeatherHelper
  def convert_to_timestamp(date)
    timestamp = Time.parse(date.to_s).to_i
    response = HTTParty.get("https://api.darksky.net/forecast/3ec1bb179906fe5adcdae22233898224/47.6062,-122.3321,#{timestamp}")
    data = JSON.parse(response.body)
    @summary = data["daily"]["data"][0]["precipProbability"]
    if @summary == nil
      return "TBD"
    else
      "#{(@summary * 100).floor}%"
    end
  end
end
