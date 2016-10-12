begin
  puts "OK!"
  0 / 0
  puts "No OK!"
rescue Exception => e
  puts "Something wrong: #{e.message}"
  puts e.backtrace
end
