class Duck
  @@greeting = "Hello"

  def initialize(greeting)
    @greeting = greeting
  end

  def say
    puts @greeting
  end

  class << self
    attr_accessor :greeting

    def say
      puts "#{@@greeting} #{@greeting}"
    end


  end

end

duck = Duck.new("Кря Кря")
duck.say

Duck.greeting = "Class Кря кря"
Duck.say

Duck.greeting
