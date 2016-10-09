require_relative "Wagon"

class PassangerWagon < Wagon
  attr_accessor :number
  @@number = 0

  def initialize(type= :passenger_wagon)
    @@number+=1
    super
  end

  def self.number
    @@number
  end

end
