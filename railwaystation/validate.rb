# Написать модуль Validation, который:
# Содержит метод класса validate. Этот метод принимает в качестве параметров
# имя проверяемого атрибута, а также тип валидации и при необходимости
# дополнительные параметры.
# Возможные типы валидаций:
# presence - требует, чтобы значение атрибута было не nil и не пустой строкой.
# Пример использования: validate :name, :presence
# format (при этом отдельным параметром задается регулярное выражение для формата).
# Треубет соответствия значения атрибута заданному регулярному выражению.
# Пример: validate :number, :format, /A-Z{0,3}/
# type (третий параметр - класс атрибута). Требует соответствия значения атрибута
# заданному классу. Пример: validate :station, :type, RailwayStation
# Содержит инстанс-метод validate!, который запускает все проверки (валидации),
# указанные в классе через метод класса validate. В случае ошибки валидации
# выбрасывает исключение с сообщением о том, какая именно валидация не прошла.
# Содержит инстанс-метод valid? который возвращает true, если все проверки
# валидации прошли успешно и false, если есть ошибки валидации.
# Заменить валидации в проекте железной дороги на этот модуль и методы из него.

module Validate

  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    def validate(name, type, *optional)
      if type == :presence
        value = instance_variable_get("@#{name}")
        fail 'Argument is empty string' if value.nil? || value.empty?
      end
    end
  end

  module InstanceMethods
  end



end
