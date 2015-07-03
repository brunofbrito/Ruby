# HEAD é o primeiro, TAIL é o restante
# LAST é o úlimo, INIT é o restante
# Definir 4 métodos, para estes 4 cenários

numbers = [1,2,3,4,5,6,7,8,9,10]
# podia ser array = Array(1..10)

def head(number)
  number.first
end

def tail(number)
  number.drop(1)
# number[1..-1]
end

def last(number)
  number.last
end

def init(number)
  number.take(number.size-1)
# number[0..-2]
end

p head(numbers)
p tail(numbers)
p last(numbers)
p init(numbers)