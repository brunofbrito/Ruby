class Ghost
  def initialize
    @color = ["white","yellow","purple","red"].sample
  end

  def color
    @color
  end
end

ghost = Ghost.new

# "white" or "yellow" or "purple" or "red"
puts ghost.color