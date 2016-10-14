class Route
  attr_accessor :first, :last

  def initialize(first, last)
    @list = []
    @list << first.name
    @list << last.name
  end

  def add_station(station)
    raise "Неверный тип станции #{station.class}" unless station.is_a?(RailwayStation)
    @list.insert(-2, station.name)
  end

  def remove_station(station)
    @list.delete(station.name) if @list.include?(station.name)
  end

  def show_stations
    # puts "Маршрут  #{@list.first} -> #{@list.last}"
    @list.each_with_index { |station, index| puts "#{index + 1}. #{station}" }
  end

  def route_list
    @list
  end
end
