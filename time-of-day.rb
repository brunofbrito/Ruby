# Morning: 6h-12h
# Afternoon: 12h-18h
# Evening: 18h-24h
# Night: 0h-6h
# inputs - current date/time
# outputs - time of day

require 'date'

hour = DateTime.now.hour
# minutes = DateTime.now.minutes

# ALTERNATIVA 1

def time_of_day(my_hour)
  if my_hour >= 6 && my_hour <12
    "We're in the morning!"
  elsif my_hour >= 12 && my_hour <18
    "We're in the afternoon!"
  elsif my_hour >=18 && my_hour <24
    "We're in the evening!"
  else 
     "We're in the night!"
  end
end

# ALTERNATIVA COM .between , que como é inclusivo dá valores diferentes

# def time_of_day(my_hour)
#   if my_hour.between?(6,12)
#     "We're in the morning!"
#   elsif my_hour.between?(13,18)
#     "We're in the afternoon!"
#   elsif my_hour.between?(19,24)
#     "We're in the evening!"
#   else 
#      "We're in the night!"
#   end
# end

# ALTERNATIVA 3

# def timenow(hours)
#   if hours > 18
#     "We're in the evening!"
#   elsif hours > 12
#     "We're in the afternoon!"
#   elsif hours  > 6
#     "We're in the morning!"
#   else 
#      "We're in the night!"
#   end
# end

puts "What's the time?"
hour = gets.to_i
puts time_of_day(hour)