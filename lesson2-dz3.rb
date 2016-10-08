# Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу
# и кол-во купленного товара (может быть нецелым числом). Пользователь может ввести
# произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара.
# На основе введенных данных требуетеся:
# Заполнить и вывести на экран хеш, ключами которого являются названия товаров,
# а значением - вложенный хеш, содержащий цену за единицу товара и кол-во купленного товара.
# Также вывести итоговую сумму за каждый товар.
# Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".

store = Hash.new

while true

  puts "Name:"
  title = gets.chomp
  if title.downcase == "stop"
    puts store

    sum = 0
    store.each do |key, value|
      current_price = value[:price] * value[:count]
      sum+=current_price
      puts "Total price #{key} = $#{current_price}"
    end

    puts "Sum goods #{sum}"

    break
  end

  puts "Price:"
  price = gets.chomp.to_f
  puts "Count:"
  count = gets.chomp.to_i

  store[title] = { price: price, count: count }

end
