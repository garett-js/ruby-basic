require_relative 'wagon'

class PassangerWagon < Wagon
  attr_accessor :number

  def initialize(company_name)
    @type = :passenger_wagon
    super
  end
end
