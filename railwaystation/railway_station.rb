# У класса RailwayStation написать метод, который принимает блок и
# выполняет действия из блока над каждым поездом (Train), находящимся
# в данный момент на станции.

class RailwayStation
  attr_accessor :name, :list

  @@number = 0
  @@list_station = []

  def initialize(name)
    @@number += 1
    @@list_station << name

    @name = name
    @list = []

    validate!
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.all
    puts "Станций на текущий момент #{@@number}"
    @@list_station.each_with_index { |el, i| puts "#{i + 1}: #{el}" }
  end

  def take_train(train)
    type = train.type
    @list << type
  end

  def show_trains
    if block_given?
      passenger_count = @list.count(:passenger_train)
      freight_count = @list.count(:cargo_train)
      yield(@name, @list, passenger_count, freight_count)
    else
      puts "Станция: #{@name}. Поезда: #{@list}"
    end
    # puts "Станция: #{@name}. Поезда: #{@list} -> (Пассажирских:#{passenger_count}, Грузовых #{freight_count})"
  end

  def show_type_train
    @list.each { |el| el.type.to_s }
  end

  protected

  def validate!
    raise 'Название станции должно быть типа String' unless name.is_a?(String)
    raise 'Название станции должно быть больше 1 символа' if name.length < 2
    true
  end
end
