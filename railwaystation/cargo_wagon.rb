require_relative 'wagon'

class CargoWagon < Wagon
  attr_accessor :number

  def initialize(company_name)
    @type = :cargo_wagon
    super
  end
end
