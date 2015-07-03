# Question = Sure
# Shouting = Woah, chill out!
# Empty = Fine, be that way!
# Sentence = Whatever
# 1, 2, 3 = Whatever

# ruby bob.rb
# > Hello

def reaction(input)
  if input.strip.empty?
    "Fine, be that way!"
  elsif input == input.upcase && input != input.downcase
    "Woah, chill out!"
  elsif input.include?("?")
    "Sure."
  else
    "Whatever..."
  end 
end

loop do
  print "> " 
  conversation = gets.chomp
  if conversation.downcase == "bye"
    puts "Goodbye."
    break
  end
  puts reaction(conversation)
end