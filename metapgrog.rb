# Написать модуль, содержащий 2 метода, которые можно вызывать на урвне класса:

# метод att_accessor_with_history.
# Динамически создает геттеры и сеттеры для
# любого кол-ва атрибутов, при этом сеттер сохраняет все значения
# инстанс-переменной при изменении этого значения.
# Также должен быть метод <имя_атрибута>_history,
# который возвращает массив всех значений данной переменной.

# метод strong_attr_acessor,
# который принимает имя атрибута и его класс.
# При этом создается геттер и сеттер для одноименной инстанс-переменной,
# но сеттер проверяет тип присваемоего значения. Если тип отличается от того,
# который указан вторым параметром, то выбрасывается исключение.
# Если тип совпадает, то значение присваивается.
# Подключить модуль в класс и продемонстрировать применение этих методо

module ExtAttrAcessor
  def att_accessor_with_history(*args)
    args.each do |arg|
      var_name = "@#{arg}".to_sym
      arg_history = []

      define_method(arg) { instance_variable_get(var_name) }
      define_method("#{arg}=".to_sym) do |value|
        instance_variable_set(var_name, value)
        arg_history << value
      end
      define_method("#{arg}_history".to_sym) { arg_history }
    end
  end

  def strong_attr_accessor(arg_name, arg_class)
    i_var = "@#{arg_name}".to_sym

    define_method(arg_name) { instance_variable_get(i_var) }
    define_method("#{arg_name}=") do |value|
      raise 'type mismatch' unless value.is_a?(arg_class)
      instance_variable_set(i_var, value)
    end
  end
end


class Test
  extend ExtAttrAcessor
  att_accessor_with_history :a, :b, :c
  strong_attr_accessor :d, String
end

test = Test.new

test.d = 'String?'
p test.d

test.a = 123
test.a = 345
test.a = 987
test.b = 'kkk'
test.b = 777
test.c = 'ccc'
test.c = 0o00

p test.a_history, test.b_history, test.c_history
