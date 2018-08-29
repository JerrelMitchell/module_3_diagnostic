class SearchController < ApplicationController
  def index
    zip = params[:q]

    @conn = Faraday.new(url: "https://developer.nrel.gov") do |faraday|
      faraday.headers["X-Api-Key"] = "E4uQDdiWAn5CyHH7zDzCQKSbA93h77EbeikhzKiN"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations//v1/nearest.json?location=#{zip}&radius=6&fuel_type=ELEC,LPG&limit=10")

    stations_data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations]

    @stations = StationService.new(stations_data).stations
  end
end
