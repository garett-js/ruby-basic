require_relative "Train"

class CargoTrain < Train

  def initialize(type= :cargo_train)
    super
  end

  def add_wagon
    if self.speed == 0
      wagon = CargoWagon.new()
      self.wagon << wagon
      puts "Добавлен новый вагон типа: Грузовой"
    else
      puts "Поезд всё еще в движении, не возможно добавить вагон"
    end
  end

end
