# start = Time.now

fishies = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish',
          'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggo(le_fish)
  da_longest = "?"
  le_fish.each do |fish|
    current_fish_length = fish.length
    le_fish.each do |comparee|
      if comparee.length > current_fish_length && comparee.length > da_longest.length
        da_longest = comparee
      end
    end
  end

  da_longest
end

puts sluggo(fishies)


class Array
  def sm_dom(&prc)
    prc ||= Proc.new { |x, y| y.length <=> x.length }
    return self if self.length <= 1

    mid = self.length / 2
    sorted_left = self.take(mid).sm_dom(&prc)
    sorted_right = self.drop(mid).sm_dom(&prc)

    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end

end

puts fishies.sm_dom.first


def clevie(arr)
  longest = arr[0]

  arr.each do |fish|
    if fish.length > longest.length
      longest = fish
    end
  end
  longest
end
puts clevie(fishies)
# 4.4e-05

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_tango(m, arr)
  arr.each_with_index do |move, idx|
    return idx if move == m
  end
end

puts slow_tango("left", tiles_array)

anonymous_hash = {
  up: 0,
  rup: 1,
  right: 2,
  roun: 3,
  down: 4,
  lown: 5,
  left: 6,
  lup: 7
}

def con_dance(m, hash)
  return hash[m]
end

puts con_dance(:down, anonymous_hash)
