# Is the number prime?
# Is the number even?
# Is the number a multiple of 10?
# Each should return either true of false, which should be given as an array
# number_property(7) # ==> [true, false, false]
# The number will always be an integer, either positive or negative. Note that negative numbers cannot be primes, they can be multiples of 10.

require 'prime'

def number_property(number)
  result = []
  result << Prime.prime?(number)
  result << number.even?
  result << ((number%10) == 0)
  result
end

p number_property(7)
p number_property(10)
p number_property(-7)
p number_property(-10)