require "Date"

# Returns the day of calendar week
puts Date.new(2016,10,7).cwday
# Returns the calendar week number
puts Date.new(2016,10,7).cweek
# Returns the day of the year
puts Date.new(2016,10,7).yday

# and easy way
time = Time.new
puts "Currently date #{time} and day of year #{time.yday}"
