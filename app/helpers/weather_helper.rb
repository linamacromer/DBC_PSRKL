require "date"
require "httparty"
require "time"

module WeatherHelper

  def convert_to_timestamp(date)
    timestamp = Time.parse(date.to_s).to_i
    response = HTTParty.get("https://api.darksky.net/forecast/7285a7f0703bd521ebf583910b025edd/47.6062,-122.3321,#{timestamp}")
    data = JSON.parse(response.body)
    @summary = data["daily"]["data"][0]["summary"]
  end

end
