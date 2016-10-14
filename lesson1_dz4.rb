# Квадратное уравнение (усложненное задание). Пользователь вводит 3 коэффициента a, b и с.
# Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) и
# выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
# Если D > 0, то выводим дискриминант и 2 корня
# Если D = 0, то выводим дискриминант и 1 корень (т.к. они в этом случае равны)
# Если D < 0, то выводим дискриминант и сообщение "Корней нет"
# Подсказки: Вот здесь описан алгоритм решения с блок-схемой.
# Для вычисления квадратного корня, нужно использовать `Math.sqrt`,
# например, `Math.sqrt(16)` вернет 4, т.е. квадратный корень из 16.

puts "enter a:"
a = gets.chomp.to_i
puts "enter b:"
b = gets.chomp.to_i
puts "enter c:"
c = gets.chomp.to_i

d = b**2 - 4*a*c

if d > 0
  x1 = ( -b + Math.sqrt(d) ) / 2.0*a
  x2 = ( -b - Math.sqrt(d) ) / 2.0*a
  puts "Дискриминант D=#{d}, корни уравнения: x1=#{x1}, x2=#{x2}"
elsif d == 0
  x1 = ( -b + Math.sqrt(d) ) / 2.0*a
  puts "Дискриминант D=#{d}, корни уравнения: x1=x2=#{x1}"
else
  puts "Корней нет"
end