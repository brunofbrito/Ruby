def prettify(array)
  # array.map(&:upcase).map(&:reverse)
  array.map{ |string| string.reverse.upcase }
end

initial_array = ["New York", "Paris", "Lisbon"]

p prettify(initial_array)
# => ["KROY WEN", "SIRAP", "NOBSIL"]*