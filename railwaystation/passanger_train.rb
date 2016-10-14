require_relative 'train'

class PassangerTrain < Train
  def initialize(company_name, number)
    @type = :passenger_train
    super
  end

  def add_wagon(company_name = 'unknown')
    if speed.zero?
      wagon = PassangerWagon.new(company_name)
      self.wagon << wagon
    else
      puts 'Поезд всё еще в движении, не возможно добавить вагон'
    end
  end
end
