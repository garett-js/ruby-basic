# encoding: UTF-8

# диспетчеру железнодорожной странции управлять поездами:
# принимать, отправлять, показывать информацию и т.д.
# (точнее, мы будем создавать его объектную модель). Нужно написать:

# Классы Train и RailwayStation, Route для поезда, ж.д. станции и маршрута соответственно.
# Станция:
    # Имеет название, которое указывается при ее создании
    # Может принимать поезда
    # Может показывать список всех поездов на станции, находящиеся в текущий момент
    # Может показывать список поездов на станции по типу (см. ниже): кол-во грузовых, пассажирских
    # Может отправлять поезда (при этом, поезд удаляется из списка поездов, находящихся на станции).
# Маршрут:
    # Имеет начальную и конечную станцию, а также список промежуточных станций
    # Может добавлять станцию в список
    # Может удалять станцию из списка
    # Может выводить список всех станций по-порядку от начальной до конечной
# Поезд:
    # Имеет, тип, который указывается при создании: грузовой, пассажирский и количество вагонов.
    #Поезд может делать следующие вещи:
      # набирать скорость
      # показывать текущую скорость
      # тормозить
      # показывать количество вагонов
      # прицеплять/отцеплять вагоны (по одному вагону за операцию, метод просто
      # увеличивает или уменьшает количество вагонов). Прицепка/отцепка вагонов может
      # осуществляться только если поезд не движется.
      # Принимать маршрут следования
      # Перемещаться между станциями, указанными в маршруте.
      # Показывать предыдущую станцию, текущую, следующую, на основе маршрута

class RailwayStation
  attr_accessor :name, :list

  def initialize(name)
    @name = name
    @list = []
  end

  def take_train(train)
    type = train.type
    @list << type
  end

  def show_trains

    passenger_count = @list.count("passenger")
    freight_count = @list.count("freight")

    puts "Станция: #{@name}. Поезда: #{@list} -> (Пассажирских:#{passenger_count}, Грузовых #{freight_count})"

  end

  def show_type_train
    for train in @list
      puts "#{train.type}"
    end

  end

end

class Route

  def initialize(first, last)
    @list = []
    @list << first.name
    @list << last.name
  end

  def add_station(station)
    @list.insert(-2,station.name)
  end

  def remove_station(station)
    @list.delete(station.name) if @list.include?(station.name)
  end

  def show_stations
    puts "Маршрут  #{@list.first} -> #{@list.last}"
    @list.each_with_index{ |station, index| puts "#{index + 1}. #{station}"}
  end

  def route_list
    return @list
  end

end


class Train
  attr_accessor :wagon, :type, :speed, :type, :route, :station

  def initialize(type, number)
    @type = type.downcase
    @number = number
    @speed = 0
    @wagon = 0
    puts "Добавлен новый поезд типа: #{@type}, id: #{self.object_id}"
  end

  def stop
    self.speed = 0
    "Train has stoped"
  end

  def speed_up
    self.speed += 10
    puts "Скорость поезда теперь: #{self.speed}"
  end

  def add_wagon
    if self.speed == 0
      self.count_carriage+=1
      puts "Добавлен новый вагон"
    else
      puts "Поезд всё еще в движении, не возможно добавить вагон"
    end
  end

  def delete_wagon
    if self.speed == 0
      self.count_carriage-=1
      puts "Отцеплен вагон"
    else
      puts "Поезд всё еще в движении, не возможно отцепить вагон"
    end
  end

  def take_route(route)
    self.route = route
  end

  def current_station
    puts "Текущая станция: #{self.station}"
  end

  def move_to(station)
    @station = station.name
    station.take_train(self)
  end

  def next_station
    index = 0
    index = self.route.route_list.index(@station)
    if index == self.route.route_list.length-1
      puts "А дальше станций нет!"
    else
      puts "Следущая станция: #{self.route.route_list[index+1]}"
    end
  end

  def prev_station
    index = self.route.route_list.index(@station)
    if index == 0
      puts "Это начальная станция"
    else
      puts "Предыдущая станция: #{self.route.route_list[index-1]}"
    end
  end

end

red_falcon = Train.new("Passenger", 15)
red_falcon_2 = Train.new("Freight", 10)
red_falcon_3 = Train.new("Passenger", 12)

bsk = RailwayStation.new("Бийск")
brn = RailwayStation.new("Барнаул")
psh = RailwayStation.new("Поспелиха")
bst = RailwayStation.new("Бостон")
nsk = RailwayStation.new("Новосибирск")

altai_route = Route.new(bsk, nsk)

altai_route.add_station(brn)
altai_route.add_station(psh)
altai_route.add_station(bst)
altai_route.remove_station(bst)

puts ""
altai_route.show_stations

puts ""
red_falcon.take_route(altai_route)
red_falcon_2.take_route(altai_route)
red_falcon_3.take_route(altai_route)
puts ""

red_falcon.move_to(brn)
red_falcon_2.move_to(bsk)
red_falcon_3.move_to(bsk)

bsk.show_trains
brn.show_trains
psh.show_trains
nsk.show_trains

puts ""
puts "red falcon:"
red_falcon.current_station
red_falcon.next_station
red_falcon.prev_station
puts ""
puts "red falcon 2:"
red_falcon_2.current_station
red_falcon_2.next_station
red_falcon_2.prev_station
puts ""
puts "red falcon 3:"
red_falcon_3.current_station
red_falcon_3.next_station
red_falcon_3.prev_station
