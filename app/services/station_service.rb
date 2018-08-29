class StationService
  def initialize(data)
    @data = data
  end

  def stations
    @data.map do |info|
      Station.new(info)
    end
  end
end
