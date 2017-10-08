# Our Map class should have the following instance methods:
# assign(key, value), lookup(key), remove(key), show. Note that the assign
#  method can be used to either create a new key-value pair or update the
#  value for a pre-existing key. It's up to you to check whether a key
#  currently exists!

class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    if @map.index {|num| num[0] == key}
      @map[values] = value
    else
      @map.push([key, value])
    end

    [key, value]
  end

  def lookup(key)
    @map.each do |pair|
      if pair[0] == key
        return pair[1]
      end
    end

    nil
  end

  def remove(key)
    @map.reject! do |pair|
      pair[0] == key
    end
    nil
  end

  def show
    @map
  end

end
