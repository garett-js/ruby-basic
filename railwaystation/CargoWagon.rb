require_relative "Wagon"

class CargoWagon < Wagon
  attr_accessor :number
  @@number = 0

  def initialize(type= :cargo_wagon)
    @@number+=1
    super
  end

  def self.number
    @@number
  end

end
