# shopping_list = ['Beer', 'Water', 'Cookies']

# shopping_list_amount = shopping_list.size
# puts "I have to buy #{shopping_list_amount} items!"

# list_has_chips = shopping_list.include? "Chips"
# puts "Chips on the list? " + list_has_chips.to_s

# shopping_list << "Chips"

# puts "Last item on the list: #{shopping_list.last}"

# single_line_list = shopping_list.join"; "
# puts "Items: #{single_line_list}"

# shopping_list.each do |item|
#   puts item
# end

# shopping_list.each_with_index do |item, index|
#   puts "Position #{index.to_s}: #{item}"
# end

products = [
{name: "Beer", price: 3},
{name: "Chips", price: 1},
{name: "Water", price: 1}
]

total = 0

products.each do |product|
  total = total + product[:price]
end

puts total