#Идеальный вес. Программа запрашивает имя и рост и выводит идеальный вес по формуле <рост> - 110,
#после чего выводит результат пользователю на экран с обращением по имени.
#Если идеальный вес получается отрицательным, то выводится строка "Ваш вес уже оптимальный"

puts "What is your name?"
name = gets.chomp()

puts "What is you height?"
height = gets.chomp().to_i


weight = height - 110

if ( weight > 0 )
  puts "Привет, #{name}. Твой идеальный вес #{weight}"
else
  puts "Привет, #{name}. Твой вес и так норм"
end


# something about oop in Ruby

class Student
  attr_accessor :first_name, :last_name, :primary_phone_number

  def introduction
    puts "Hello, my name is #{first_name}"
  end
end

alex = Student.new
alex.first_name = "Alex Jason"
alex.introduction
