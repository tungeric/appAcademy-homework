class Stack
  attr_reader :stack

  def initialize
    # create ivar to store stack here!
    @stack = []
  end

  def add(el)
    @stack << el
    el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.dup
  end
end
