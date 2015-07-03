def allowed_to_drink

  age = ARGV[0]

  if age == nil
    "Error: Age not provided."
  elsif age.to_i < 18
    puts "You are #{age}, so you are not allowed to drink."
  else 
    puts "You are #{age}, so you are allowed to drink."
  end
end

puts allowed_to_drink

# ALTERNATIVA:
# puts "How old are you?"
# age = gets.chomp

#   if age.empty?
#     puts "Error: Age not provided."
#   elsif age.to_i < 18
#     puts "You are #{age}, so you are not allowed to drink."
#   else 
#     puts "You are #{age}, so you are allowed to drink."
#   end