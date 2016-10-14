# Площадь треугольника. Площадь треугольника можно вычилсить,
# зная его основание (a) и высоту (h) по формуле: 1/2*a*h.
# Программа должна запрашивать основание и высоту треуголиника и возвращать его площадь.

puts "base of triangle?"
base = gets.chomp.to_i
puts "height of triangle?"
height = gets.chomp.to_i

area = 1.0/2 * base * height
puts "area of triangle #{area}"
