class Station
  attr_reader :name, :address, :fuel_type, :access_times,
  :distance, :travel_time, :directions

  def initialize(station_info, direction_info)
    @station_info = station_info
    @direction_info = direction_info
  end

  def name
    @station_info[:station_name]
  end

  def address
    @station_info[:street_address]
  end

  def fuel_type
    @station_info[:fuel_type_code]
  end

  def access_times
    @station_info[:access_days_time]
  end

  def distance
    @direction_info[:distance][:text]
  end

  def travel_time
    @direction_info[:duration][:text]
  end

  def directions
    empty_string = ""
    @direction_info[:steps].each do |hash|
      empty_string += hash[:html_instructions]
    end
    empty_string
  end

end
