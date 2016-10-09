require_relative "Train"

class PassangerTrain < Train

  def initialize(type= :passenger_train)
    super
  end

  def add_wagon
    if self.speed == 0
      wagon = PassangerWagon.new()
      self.wagon << wagon
      puts "Добавлен новый вагон типа: Пассажирский"
    else
      puts "Поезд всё еще в движении, не возможно добавить вагон"
    end
  end

end
