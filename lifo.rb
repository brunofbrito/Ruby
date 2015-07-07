# Stack has a LIFO structure

# class Stack

#   def initialize
#     @stack = []
#   end

#   def push(number)
#      @stack.push(number)
#      # ou
#      # @data << value
#   end

#   def pop
#     @stack.pop
#   end

# end

# stack = Stack.new
# stack.push(2)
# stack.push(3)

# p stack.pop # => 3
# p stack.pop # => 2
# p stack.pop # => nil

# Queue has a FIFO structure

class Queue

  def initialize
    @stack = []
  end

  def enqueue(number)
    # @stack.unshift(number)
    @stack.insert(0, number)
  end

  def dequeue
    # @stack.pop
    @stack.delete_at(0)
  end

end

queue = Queue.new
queue.enqueue(2)
queue.enqueue(3)
p queue.dequeue # => 2
p queue.dequeue # => 3
p queue.dequeue # => nil