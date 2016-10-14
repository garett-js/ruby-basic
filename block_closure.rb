h = {a: 1, b: 2, c: 3}
h.each { |value| puts value.inspect }
h.each { |key, value| puts "#{key}=>#{value}" }

#line_num = 0
#File.open('exceptions.rb').each { |line| puts "#{line_num+=1}: #{line}" }

a = Proc.new { |i| puts i**2 } # Можно передать хоть сколько аргументов, но будет вычисляться только первый
b = proc { |i| puts i**2 } # Можно передать хоть сколько аргументов, но будет вычисляться только первый
c = lambda { |i| puts i**2 } # в метож обязательно передается столько аргументов сколько указано в ||

# puts a.methods

puts "object: #{a}, class: #{a.class}"
puts "object: #{b}, class: #{b.class}"
puts "object: #{c}, class: #{c.class}"

a.call(16,4,5)
b.call(8,7,6)
c.call(4)

# Немного про замякания и область видимости

x = "hello"
block = lambda { puts x }
block.call

puts ""
def m(b)
  x = "closure"
  puts "x from this method: #{x}"
  b.call
end
m(block)




def method_block
  puts "Before block"
  yield
  puts "After block"
end


def caps(string, &b)
  string.capitalize!
  #yield(string)
  b.call(string)
end

caps("ruby") { |string| puts "#{string}OnRails" }


def method_given(string, &b)
  if block_given?
    yield(string)
  else
    puts string
  end
end

method_given("cofeescript")
method_given("cofeescript") do |string|
  string.capitalize!
  puts "#{string} next!"
end
