class SearchController < ApplicationController
  def index
    location = params[:location]
    station_info = get_nearest_station(location)[:fuel_stations].first
    google_directions = get_google_directions(location, station_info[:street_address])
    direction_info = google_directions[:routes].first[:legs].first
    @station = Station.new(station_info, direction_info)
  end

  private

  def nrel_conn
    Faraday.new('https://developer.nrel.gov/docs/transportation/alt-fuel-stations-v1/nearest/') do |f|
      f.params['appid'] = ENV["NREL_API_KEY"]
    end
  end

  def get_nearest_station(location)
    response = nrel_conn.get("/api/alt-fuel-stations/v1/nearest.json?api_key=#{ENV["NREL_API_KEY"]}&location=#{location}&fuel_type=ELEC&limit=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def google_response(origin, destination)
    Faraday.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&key=#{ENV["GOOGLE_API_KEY"]}")
  end

  def get_google_directions(origin, destination)
    JSON.parse(google_response(origin, destination).body, symbolize_names: true)
  end
end
