# "Hello" -> "olleH"
# 123456 -> 654321
# [1,2,3] -> [1,2,3]

class Reverser
  def initialize(data)
    @tobereversed = data
  end

  def reverse
    if @tobereversed.is_a?(String)
      @tobereversed.reverse
    elsif @tobereversed.is_a?(Fixnum)
      @tobereversed.to_s.reverse.to_i
    else
      @tobereversed
    end
  end
end

reverser = Reverser.new("Hello")

puts reverser.reverse