class Dessert

  attr_reader :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def healthy?
    @calories < 200
    # É igual a isto:
    # if @calories < 200
    #   true
    # else
    #   false
    # end
  end

  def delicious?
    true  
  end

  def to_s
    "I am a #{@name}! I have #{@calories} calories"
  end

end

class JellyBean < Dessert

  attr_reader :flavor

  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def flavor?
  end

  def delicious?
    @flavor != "black licorice"
  end
    # Igual a:
    # if @flavor == "black licorice"
    #   false
    # else
    #  super
    # end 

  def to_s
    super
  end

end

dessert = Dessert.new("Pastel de Nata",100)
puts dessert
flavor = JellyBean.new("Android",150,"black licorice")
puts flavor
puts flavor.delicious?