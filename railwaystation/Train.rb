# В классе Train создать метод класса find, который принимает номер поезда и
# возвращает объект поезда
# по номеру или nil, если поезд с таким номером не найден.
# Реализовать проверку (валидацию) данных для всех классов.
# Проверять основные атрибуты (название, номер, тип и т.п.) на наличие,
# длину и т.п. (в зависимости от атрибута):
# Валидация должна взываться при создании объекта, если объект невалидный,
# то должно выбрасываться исключение
# Должен быть метод valid? который возвращает true, если объект валидный
# и false - в противном случае.
# Релизовать проверку на формат номера поезда. Допустимый формат: три буквы
# или цифры в любом порядке,
# необязательный дефис (может быть, а может нет) и еще 2 буквы или цифры
# после дефиса.
# Релизовать интерфейс, который бы выводил пользователю ошибки валидации
# без прекращения работы программы.
# Убрать из классов все puts (кроме методов, которые и должны что-то
# выводить на экран),
# методы просто возвращают значения. (Начинаем бороться за чистоту кода).
# У класса Train написать метод, который принимает блок и проходит по всем
# вагонам поезда, передавая каждый объект вагона в блок.

require_relative 'company_name'

class Train
  attr_accessor :wagon, :type, :speed, :route, :station, :number
  include CompanyName

  TRAIN_NUMBER_FORMAT = /^([a-z]|\d){3}-?([a-z]|\d){2}$/i

  @@list_train = {}

  def initialize(company_name, number)
    raise 'Нельзя создать поезд с таким же номером' if @@list_train.include?(number)
    @@list_train[number] = self

    @number = number
    @speed = 0
    @wagon = []
    @company_name = company_name

    validate!
  end

  def valid?
    validate!
    false
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
  end

  def speed_up
    self.speed += 10
  end

  def delete_wagon
    if self.speed.zero?
      wagon.pop unless wagon.empty?
    else
      puts 'Поезд всё еще в движении, не возможно отцепить вагон'
    end
  end

  def take_route(route)
    self.route = route
  end

  def current_station
    station
  end

  def move_to(station)
    @station = station.name
    station.take_train(self)
  end

  def next_station
    index = route.route_list.index(@station)
    if index == route.route_list.length - 1
      puts 'А дальше станций нет!'
    else
      puts "Следущая станция: #{route.route_list[index + 1]}"
    end
  end

  def prev_station
    index = route.route_list.index(@station)
    if index.zero?
      puts 'Это начальная станция'
    else
      puts "Предыдущая станция: #{route.route_list[index - 1]}"
    end
  end

  # def show_wagon
  #  @wagon.each_with_index {|obj, index| print "|#{index+1}-#{obj.type}|->"}
  #  print "{#{self.type.upcase}}>"
  # end

  def show_wagon
    if block_given?
      @wagon.each_with_index { |wagon, index| yield(wagon, index) }
    else
      @wagon.each { |obj| print "#{obj.type}, " }
    end
  end

  # method for lamda (Proc)
  # def show_wagon(block)
  #   @wagon.each_with_index { |wagon, index| block.call(wagon, index) }
  # end

  protected

  def validate!
    raise 'Неверный номер поезда' if number !~ TRAIN_NUMBER_FORMAT
    raise 'Название Компании должно быть типа String' unless company_name.is_a?(String)
    raise 'Название Компании должно быть больше 1 символа' if company_name.length < 2
    true
  end
end
