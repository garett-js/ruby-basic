# Задание:
# Разбить программу на отдельные классы (каждый класс в отдельном файле)
# Разделить поезда на два типа PassangerTrain и CargoTrain,
# сделать родителя для классов,
# который будет содержать общие методы и свойства
# Определить, какие методы могут быть помещены в private/protected и вынести их
# в такую секцию.
# В комментарии к методу обосновать, почему он был вынесен в private/protected
# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы).
# К пассажирскому поезду можно прицепить только пассажирские,
# к грузовому - грузовые.

require_relative 'route'
require_relative 'railway_station'

require_relative 'passanger_train'
require_relative 'cargo_train'

require_relative 'passanger_wagon'
require_relative 'cargo_wagon'

red_train = PassangerTrain.new('Крутая пассажирская компания', 'abc-12')
green_train = PassangerTrain.new('Крутая пассажирская компания', '666-ex')
black_train = CargoTrain.new('Крутая грузовая компания', '777az')
# black_train2 = CargoTrain.new("Крутая грузовая компания","777az")

puts PassangerTrain.find('abc-12')
puts PassangerTrain.find('666-ex')
puts PassangerTrain.find('777az')

puts ''
red_train.add_wagon('Крутая пассажирская компания')
red_train.add_wagon('Крутая пассажирская компания')
red_train.add_wagon('Крутая пассажирская компания')
puts ''
green_train.add_wagon
green_train.add_wagon
puts ''
black_train.add_wagon('Крутая грузовая компания')

puts 'Компании производители:'
print 'Поезд: '
puts red_train.company_name
puts 'Вагоны:'
red_train.wagon.each_with_index { |el, i| puts "#{i + 1}: #{el.company_name}" }
print 'Поезд: '
puts green_train.company_name
puts 'Вагоны:'
green_train.wagon.each_with_index { |el, i| puts "#{i + 1}: #{el.company_name}" }
print 'Поезд: '
puts black_train.company_name
puts 'Вагоны:'
black_train.wagon.each_with_index { |el, i| puts "#{i + 1}: #{el.company_name}" }

bsk = RailwayStation.new('Бийск')
# bsk.name = "2"
puts 'Ошибка валидации' unless bsk.valid?

brn = RailwayStation.new('Барнаул')
psh = RailwayStation.new('Поспелиха')
bst = RailwayStation.new('Бостон')
nsk = RailwayStation.new('Новосибирск')

puts ''
RailwayStation.all

altai_route = Route.new(bsk, nsk)

altai_route.add_station(brn)
altai_route.add_station(psh)
altai_route.add_station(bst)
altai_route.remove_station(bst)

# altai_route.add_station("bug")

puts ''
altai_route.show_stations

puts ''
red_train.take_route(altai_route)
green_train.take_route(altai_route)
black_train.take_route(altai_route)
puts ''

red_train.move_to(brn)
green_train.move_to(brn)
black_train.move_to(bsk)

bsk.show_trains do |station, trains, p_number, c_number|
  puts "Станция: #{station}. Поезда: #{trains} ->
        (Пассажирских:#{p_number}, Грузовых #{c_number})"
end
brn.show_trains
psh.show_trains
nsk.show_trains

# b_wagon = lambda {|obj, index| print "|#{index+1}-#{obj.type}|->"}

puts ''
red_train.show_wagon { |obj, index| print "|#{index + 1}-#{obj.type}|->" }
puts ''
green_train.show_wagon
puts ''
black_train.show_wagon
puts ''

puts ''
puts 'Красный поезд:'
red_train.current_station
red_train.next_station
red_train.prev_station
puts ''
puts 'Зеленый поезд:'
green_train.current_station
green_train.next_station
green_train.prev_station
puts ''
puts 'Черный поезд:'
black_train.current_station
black_train.next_station
black_train.prev_station
