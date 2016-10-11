# В классе Train создать метод класса find, который принимает номер поезда и возвращает объект поезда
# по номеру или nil, если поезд с таким номером не найден.

require_relative "CompanyName"

class Train
  attr_accessor :wagon, :type, :speed, :route, :station, :number
  include CompanyName

  @@list_train = {}

  def initialize(company_name, number)
    self.company_name = company_name

    @@list_train[number] = self

    @string_type = ""
    if type == :cargo_train
      @string_type = "Грузовой"
    elsif type == :passenger_train
      @string_type = "Пассажирский"
    else
      @string_type = "Не понятный тип"
    end

    @speed = 0
    @wagon = []

    puts "Добавлен новый поезд типа: #{@string_type}, id: #{self.object_id}"
  end

  def self.find(number)
    if @@list_train[number].nil?
      nil
    else
      @@list_train[number]
    end
  end

  def stop
    self.speed = 0
    "Train has stoped"
  end

  def speed_up
    self.speed += 10
    puts "Скорость поезда теперь: #{self.speed}"
  end

  def delete_wagon
    if self.speed == 0
      self.wagon.pop if self.wagon.length > 0
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

  def show_wagon
    puts "Тип поезда #{@string_type}:"
    @wagon.each_with_index {|obj, index| print "|#{index+1}-#{obj.type}|->"}
    print "{#{self.type.upcase}}>"
  end

end
