require_relative 'train'

class CargoTrain < Train
  def initialize(company_name, number)
    @type = :cargo_train
    super
  end

  def add_wagon(company_name = 'РЖД')
    if speed.zero?
      wagon = CargoWagon.new(company_name)
      self.wagon << wagon
    else
      puts 'Поезд всё еще в движении, не возможно добавить вагон'
    end
  end
end
