# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным

require "Date"

puts "Day: "
day = gets.chomp.to_i
puts "Month: "
month = gets.chomp.to_i
puts "Year: "
year = gets.chomp.to_i

date = Date.new(year,month,day)
type_year = Date.leap?(year) ? "leap year": "common year"
puts "Currently date: #{date}, day of year: #{date.yday} and #{type_year}"

# Returns the day of calendar week
# puts Date.new(year,month,day).cwday
# Returns the calendar week number
# puts Date.new(year,month,day).cweek
# Returns the day of the year


# for Time
# time = Time.new
# puts "Currently date #{time}, day of year #{time.yday}"
