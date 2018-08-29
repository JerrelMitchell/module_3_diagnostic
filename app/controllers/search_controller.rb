class SearchController < ApplicationController
  def index
    zip = params[:zip]

    @conn = Faraday.new(url: "https://nrel.gov") do |faraday|
      faraday.headers["api_key"] = "E4uQDdiWAn5CyHH7zDzCQKSbA93h77EbeikhzKiN"
      faraday.adapter Faraday.default_adapter
    end

    response = @conn.get("/api/alt-fuel-stations/v1/nearest.json?zip=#{zip}")

    @stations = JSON.parse(response.body, symbolize_names: true)[:results]
  end
end
