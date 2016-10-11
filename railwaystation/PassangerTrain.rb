require_relative "Train"

class PassangerTrain < Train

  def initialize(company_name, number)
    @type = :passenger_train
    super
  end

  def add_wagon(company_name = "РЖД")
    if self.speed == 0
      wagon = PassangerWagon.new(company_name)
      self.wagon << wagon
      puts "Добавлен новый вагон типа: Пассажирский"
    else
      puts "Поезд всё еще в движении, не возможно добавить вагон"
    end
  end

end
