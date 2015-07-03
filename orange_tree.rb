class OrangeTree

  def initialize
    @birth = 0
    @lifecycle = 0
    @height = 0
    @fruits = 0
    @fruit_picked = 0
    @dead = false
    @found_dead = false
  end

  # TODO: age the tree of one year
  # TODO: check if the tree has survived
  # TODO: if so, make the tree height grow
  # TODO: if so, make the tree grow fruits

  def one_year_passes!
    @lifecycle += 1
      if @lifecycle <= 10
         @height += 1
        puts "Your tree is now #{@lifecycle} years old, is #{@height} metres tall and has #{@fruits}."
      elsif @lifecycle < 100
        puts "Your tree is now #{@lifecycle} years old, is #{@height} metres tall and has #{@fruits}.!"
      else
        puts "Your tree is dead :("
      end

      if @lifecycle.between?(5,10)
        @fruits += 100 
      elsif @lifecycle.between?(11,15)
        @fruits += 200 
      # else
      #   @fruits = 0
      end
  end

  def measure_tree
    puts "Your tree is now #{@height} metres tall."
  end

  def height
    @height
  end

  def dead?
    if @lifecycle >= 100
      puts "Your tree is dead :("
      @dead = true
    elsif @lifecycle >= 50
      @dead || @found_dead
    else
      @dead = false
    end
  end

  def fruit
    puts "Your Tree has #{@fruits} fruits." 
  end

   def pick_fruit(numberofitems)
    puts "How many oranges?"
    numberofitems = @fruit_picked + gets.chomp.to_i
    puts "You picked #{numberofitems} oranges."
    @fruits = @fruits - numberofitems
  end

end

tree = OrangeTree.new
100.times do 
  tree.one_year_passes!
  puts @height
end

tree.fruit
tree.pick_fruit(20)
tree.fruit
tree.dead?

# You should be able to measure the tree
# Each year, the tree should age (it becomes older and taller, and eventually dies).
# A tree grows 1 meter per year up to 10 years old. Then it stops.
# Before it is 50 years old, the probability of dying as a year passes is zero.
# After it is 50 years old, the probability of dying increases
# No tree can live more than 100 years
# A tree will produce 100 fruits a year once it is 5 years old
# A tree will produce 200 fruits a year between 10 and 15 years old
# A tree will not produce any fruits after that
# You should be able to pick a fruit from the tree
# You should be able to count how many fruits on the tree there are left
# Every year, fruits which were not picked just fall off