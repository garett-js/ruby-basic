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
  attr_accessor :name

  def initialize(name)
    @name = name
    @list_train = []
  end

  def take_train(train)
    @list_train << train
  end

  def show_trains
    puts @list_train.inspect
  end

  def show_type_train
    for train in @list_train
      puts "#{train.type}"
    end

  end

end

class Route
  attr_accessor :first_station, :last_station, :list_station

  def initialize(first_station, last_station)
    @first_station = first_station
    @last_station = last_station
    @list_station = []
  end

  def add_station(station)
    @list_station << station.name
  end

  def remove_station(station)
    @list_station.delete(station.name) if @list_station.include?(station.name)
  end

  def show_stations
    interim_station = ""
    @list_station.each { |station| interim_station += " "+station}
    puts "Начальная станция: #{self.first_station} \n-> |#{interim_station} | ->\nКонечная станция: #{self.last_station}"
  end

end


class Train
  attr_accessor :wagon, :type, :speed, :type, :route, :station

  def initialize(type, number)
    @type = type
    @number = number
    @speed = 0
    @wagon = 0
    puts "Добавлен новый поезд типа: #{@type}"
  end

  def increase_speed(speed)
    self.speed = speed
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
    self.station = self.route.first_station
    puts "Маршрут следования поезда #{self.route.first_station} -> #{self.route.last_station}"
  end

  def current_station
    puts "Текущая станция: #{self.station}"
  end


  def move_to(station)
    if self.route.list_station.include?(station.name)
      self.station = station.name
      #station.list_train << self

    else
      puts "Такой станции нет в маршруте"
    end


  end

end

red_falcon = Train.new("Пассажирский", 15)

altai_route = Route.new("Бийск","Новосибирск")

barnaul_station = RailwayStation.new("Барнаул")
pospeliha_station = RailwayStation.new("Поспелиха")
boston_station = RailwayStation.new("Бостон")

altai_route.add_station(barnaul_station)
altai_route.add_station(pospeliha_station)
altai_route.add_station(boston_station)
altai_route.remove_station(boston_station)
altai_route.show_stations

puts ""
red_falcon.take_route(altai_route)
puts ""

red_falcon.current_station
red_falcon.move_to(pospeliha_station)
red_falcon.current_station
