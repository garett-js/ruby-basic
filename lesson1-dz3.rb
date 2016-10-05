# Прямоугольный треугольник.
# Программа запрашивает у пользователя 3 стороны треугольника и определяет,
# является ли треугольник прямоугольным, используя теорему Пифагора и выводит результат на экран.
# Также, если треугольник является при этом равнобедренным (т.е. у него равны любые 2 стороны),
# то дополнитьельно выводится информация о том, что треугольник еще и равнобедренный.
# Подсказка: чтобы воспользоваться теоремой Пифагора, нужно сначала найти самую длинную сторону
# (гипотенуза) и сравнить ее значение в квадрате с суммой квадратов двух остальных сторон.
# Если все 3 стороны равны, то треугольник равнобедренный и равносторонний, но не прямоугольный.

puts "enter AB:"
ab = gets.chomp.to_i
puts "enter BC:"
bc = gets.chomp.to_i
puts "enter CA:"
ca = gets.chomp.to_i

if ( (ab**2 == bc**2 + ca**2) ||
     (bc**2 == ca**2 + ab**2) ||
     (ca**2 == bc**2 + ab**2) )
  puts "RIGHT TRIANGLE".downcase
  if  (ab==bc || bc==ca || ca==ab)
    puts "isosceles triangle"
  end
end

if (ab==bc && bc==ca && ca==ab)
  puts "isosceles and equilateral triangle"
end
