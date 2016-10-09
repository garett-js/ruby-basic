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
