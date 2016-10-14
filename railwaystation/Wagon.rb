# Создать модуль, который позволит указывать название компании-производителя
# и получать его.
# Подключить модуль к классам Вагон и Поезд
# В классе RailwayStation (жд станция) создать метод класса all, который
# выводит список всех станций,
# созданных на данный момент
# В классе Train создать метод класса find, который принимает номер поезда и
# возвращает объект поезда
# по номеру или nil, если поезд с таким номером не найден.
# Усложенное задание: Создать модуль InstanceCounter, содержащий следующие
# методы класса и инстанс-методы,
# которые подключаются автоматически при вызове include в классе:
# Методы класса:
# instances, который возвращает кол-во экземпляров данного класса
# Инастанс-методы:
# register_instance, который увеличивает счетчик кол-ва экземпляров класса и
# который можно вызвать из конструктора.
# При этом, данный метод не должен быть публичным.
require_relative 'company_name'

class Wagon
  include CompanyName

  def initialize(company_name)
    @company_name = company_name

    validate!
  end

  attr_reader :type

  protected

  def validate!
    raise 'Название компании должно быть типа String' unless company_name.is_a?(String)
    raise 'Название компании должно быть больше 1 символа' if company_name.length < 2
    true
  end
end
