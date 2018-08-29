class AltfuelfinderService
  attr_reader :zip

  def initialize(zip)
    @zip = zip
    @conn = Faraday.new(url: 'https://developer.nrel.gov') do |faraday|
      faraday.headers['X-Api-Key'] = ENV['alt_fuel_finder_key']
      faraday.adapter Faraday.default_adapter
    end
  end

  def self.find_stations(zip)
    new(zip).find_stations
  end

  def find_stations
    get_url("/api/alt-fuel-stations//v1/nearest.json?location=#{zip}&radius=6&fuel_type=ELEC,LPG&limit=10")
  end

  def get_url(url)
    response = @con.get(url)
    JSON.parse(response.body, symbolize_names: true)[:fuel_stations]
  end
end
