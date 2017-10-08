# Now let's write a Queue class. We will need the following instance
# methods: enqueue(el), dequeue, and show.
#
# Test your code to ensure it follows the principle of FIFO.

class Queue

  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue << el
    el
  end

  def dequeue
    @queue.pop
  end

  def show
    @queue.dup
  end

end
