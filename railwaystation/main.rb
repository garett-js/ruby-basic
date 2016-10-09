# Задание:
# Разбить программу на отдельные классы (каждый класс в отдельном файле)

# Разделить поезда на два типа PassangerTrain и CargoTrain, сделать родителя для классов,
# который будет содержать общие методы и свойства

# Определить, какие методы могут быть помещены в private/protected и вынести их в такую секцию.
#В комментарии к методу обосновать, почему он был вынесен в private/protected

# Вагоны теперь делятся на грузовые и пассажирские (отдельные классы).
#К пассажирскому поезду можно прицепить только пассажирские, к грузовому - грузовые.

require_relative "route"
require_relative "RailwayStation"

require_relative "PassangerTrain"
require_relative "CargoTrain"

require_relative "PassangerWagon"
require_relative "CargoWagon"

red_train = PassangerTrain.new()
green_train = PassangerTrain.new()
black_train = CargoTrain.new()

puts ""
red_train.add_wagon()
red_train.add_wagon()
red_train.add_wagon()
puts ""
green_train.add_wagon()
green_train.add_wagon()
puts ""
black_train.add_wagon()


bsk = RailwayStation.new("Бийск")
brn = RailwayStation.new("Барнаул")
psh = RailwayStation.new("Поспелиха")
bst = RailwayStation.new("Бостон")
nsk = RailwayStation.new("Новосибирск")

altai_route = Route.new(bsk, nsk)

altai_route.add_station(brn)
altai_route.add_station(psh)
altai_route.add_station(bst)
altai_route.remove_station(bst)

puts ""
altai_route.show_stations

puts ""
red_train.take_route(altai_route)
green_train.take_route(altai_route)
black_train.take_route(altai_route)
puts ""

red_train.move_to(brn)
green_train.move_to(brn)
black_train.move_to(bsk)

bsk.show_trains
brn.show_trains
psh.show_trains
nsk.show_trains


puts ""
red_train.show_wagon
puts ""
green_train.show_wagon
puts ""
black_train.show_wagon
puts ""

puts ""
puts "Красный поезд:"
red_train.current_station
red_train.next_station
red_train.prev_station
puts ""
puts "Зеленый поезд:"
green_train.current_station
green_train.next_station
green_train.prev_station
puts ""
puts "Черный поезд:"
black_train.current_station
black_train.next_station
black_train.prev_station
