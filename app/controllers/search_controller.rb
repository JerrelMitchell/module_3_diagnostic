class SearchController < ApplicationController
  def index
    station = params[:station]

    @conn = Faraday.new(url: "https:///api/alt-fuel-stations") do |faraday|
      faraday.headers["alt_fuel_finder_api_key"] = "E4uQDdiWAn5CyHH7zDzCQKSbA93h77EbeikhzKiN"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?zip")

    @stations = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
