# Множественное присваивание
# Поменять значения 2х переменных не применяя 3ю
x,y = [1,2]
y,x = x,y

# Значения по умолчанию через ||=
# Мемоизация? "Кешерование" значений "Долгих" методов
class Foo
  def get(k)
    h = {a: 1, b: 2}
    value = h[k] ||=0
  end

  def long_method
    sleep(1)
  end

  def memoization
    @m ||= long_method
  end
end

f = Foo.new
puts f.get(:a)
puts f.get(:d)

p f.long_method
# first call 1 sec
p f.memoization
# next perm
p f.memoization

## Двойное отрицание для создания логического значения

class User
  attr_accessor :name

  def has_name?
    !!name
  end

  # Считается хорошим тоном:
  def name=(value)
    @name = value.capitalize
  end
end

user = User.new
p user.has_name?
user.name = "roman"
p user.name
p user.has_name?

# Способы задания строкого массива
list = ["apple", "orange", "penaaplepen"]
new_list = %w{apple orange penaaplepen}

# Если много записей в массиве более ЭФФЕЕКТИВНЫЙ метод:
# передавать метод как блок
p new_list.map(&:upcase)

# Считается, что длина метода должна быть не более 10 строк!!!
# как работвет case и как можно сделать подругому и более ЭФФЕЕКТИВНЕЙ через hash:

class Color
  # bad
  def code(name)
    @name = case name
    when :red
      "#f00"
    when :green
      "#0f0"
    when :blue
      "#00f"
    when :white
      "#fff"
    else
      "#000"
    end
  end
  # good
  COLOR = { red: "#foo", green: "#0f0", blue: "#00f", white: "#fff" }
  def hash_code(name)
    @name = COLOR[name] ||="#000"
  end

  # Ссылки, создание пвседонимов методов
  alias_method :by_name, :hash_code
end

color = Color.new
p color.code(:red)
p color.hash_code(:green)
p color.by_name(:blue)

# Переменное число параметров задается через *args
class Store
  attr_accessor :price, :number, :code, :name
  #def initialize(*args)
  #  @price = args[0] ||= 0
  #  @number = args[1] ||= 0
  #  @code = args[2] ||= "000000"
  #  @name = args[3] ||= "Undefined"
  #end

  # Но лучше делать через hash potions!!! в Rails везде так
  def initialize(options = {})
    @price = options[:price] || 0
    @number = options[:number] || 0
    @code = options[:code] || "000000"
    @name = options[:name] || "Undefined"
  end

end

steam = Store.new(name: "WarSongPc", price: 99, number: 1, code: "996953")
p steam.inspect

# Все класс классы и методы открытие. Можно расширять даже стандартные классы!

class String
  def self.random(length)
    rand(36**length).to_s(36)
  end
  def capt
    self.capitalize
  end
end

p String.random(14)

# Синглтон метод: Возможность добавить метод к одну единственному объекту!

class Foo
end

foo = Foo.new
bar = Foo.new
class << foo
  def method
    puts "single method for one object"
  end
end
foo.method
#bar.method
