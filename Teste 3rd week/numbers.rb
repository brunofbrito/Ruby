def order_numbers(x,y,z)
  array = [x,y,z]
  array.sort.reverse
end

p order_numbers(20, 60, 40)

#=> [3, 2, 1]