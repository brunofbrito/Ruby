# Exercício 1
list = [1, 2, 3]

total = 1

list.each do |item|
  total =  total * item 
end

puts total

# Exercício 2
list_string = ["hello", "world", "how are you", "doing?"].join(" ")
p list_string 

# Exercício 3
people = ['jo', 'nelson', 'jurie']
other_caps = people.map do |name|
  name.capitalize
end

p people
p other_caps

# Alternativa do Exercício 3 com .map!
people = ['jo', 'nelson', 'jurie']
new_people = people.map! do |name|
  name.capitalize
end

p people
p new_people