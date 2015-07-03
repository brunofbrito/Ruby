class MyString
  def initialize(value)
    @string = value
  end

  def size
    @string.size
  end
end

str = MyString.new("hello")
puts str.size