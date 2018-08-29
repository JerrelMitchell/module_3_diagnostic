class StationSerializer
  attr_reader :name, :address, :fuel_types, :distance, :access_times
  def initialize(attrs)
    @name = attrs[:station_name]
    @address = attrs[:street_address]
    @fuel_types = attrs[:fuel_type_code]
    @distance = attrs[:distance]
    @access_times = attrs[:access_days_time]
  end
end
