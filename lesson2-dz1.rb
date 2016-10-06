# Сделать хеш, содеращий месяцы и количество дней в месяце.
# В цикле выводить те месяцы, у которых количество дней ровно 30
# Заполнить массив числами от 10 до 100 с шагом 5
# Заполнить массив числами фибоначи до 100
# Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

# Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным

# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".


puts ("January".."December").to_a

month_days = {
  january: 31,
  february: 28,
  march: 31,
  april: 30,
  may: 31,
  june: 30,
  july: 31,
  august: 31,
  september: 30,
  october: 31,
  november: 30,
  december: 31
}

month_days.each do |key, value|
  if ( value == 30 )
    puts key
  end
end

number =  10
numbers = []
while number <= 100
  numbers << number
  number+=5
end
p numbers


fibonachi_numbers= []
fibonachi_numbers[0] = 0
fibonachi_numbers[1] = 1
index = 1

while fibonachi_numbers[index] < 89
  index+=1
  fibonachi_numbers[index] = fibonachi_numbers[index - 1] + fibonachi_numbers[index - 2]
end
p fibonachi_numbers


alpha = ("a".."z")
collection_vowel = {}

alpha.each_with_index do |key, index|
  collection_vowel[key] = index + 1 if %w{a o e u i}.include?(key)
end

p collection_vowel
