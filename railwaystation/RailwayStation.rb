class RailwayStation
  attr_accessor :name, :list

  @@number = 0
  @@list_station = []

  def initialize(name)
    @name = name
    @list = []

    @@number += 1
    @@list_station << name
  end

  def self.all
    puts "Станций на текущий момент #{@@number}"
    @@list_station.each_with_index {|el,i| puts "#{i+1}: #{el}"}
  end

  def take_train(train)
    type = train.type
    @list << type
  end

  def show_trains

    passenger_count = @list.count(:passenger_train)
    freight_count = @list.count(:cargo_train)

    puts "Станция: #{@name}. Поезда: #{@list} -> (Пассажирских:#{passenger_count}, Грузовых #{freight_count})"

  end

  def show_type_train
    for train in @list
      puts "#{train.type}"
    end

  end

end
