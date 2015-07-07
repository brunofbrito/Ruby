# Implement a function called makeAcronym that returns the first letters of each word in a passed in string.
# Make sure the letters returned are uppercase.
# If the value passed in is not a string return 'Not a string'.
# If the value passed in is a string which contains characters other than spaces and alphabet letters, return 'Not letters'.
# If the string is empty, just return the string itself: "".

def makeAcronym(string)
  if string.class != String
  #ou if !string.is_a?(String) 
  #ou return "Not a string" unless string.is_a?(String).
    "Not a string"
    elsif string.count("0-9") > 0
      "Not letters"
    else
      string.split.map{|word|word[0]}.join.upcase
  end
end

puts makeAcronym("Hello codewarrior how are you today?")
puts makeAcronym("ak47")
puts makeAcronym(42)
puts makeAcronym([2,12])
puts makeAcronym({name: 'Abraham'})

# 'Hello codewarrior' -> 'HC'
# 'a42' -> 'Not letters'
# 42 -> 'Not a string'
# [2,12] -> 'Not a string'
# {name: 'Abraham'} -> 'Not a string'