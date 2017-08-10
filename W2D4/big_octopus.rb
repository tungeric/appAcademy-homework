# fishes = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']


def sluggish_octopus(fishes)
  fishes.each_with_index do |fish1, i1|
    max_length = true

    fishes.each_with_index do |fish2, i2|
      next if i1 == i2
      max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
  end
end

def dominant_octopus(fishes, &prc)
  prc ||= Proc.new { |x, y| x <=> y }

  return self if count <= 1

  midpoint = count / 2
  sorted_left = self.take(midpoint).merge_sort(&prc)
  sorted_right = self.drop(midpoint).merge_sort(&prc)

  merge(sorted_left, sorted_right, &prc)
end

def merge(left, right, &prc)
  merged = []

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when 1
      merged << right.shift
    else
      merged << left.shift
    end
  end
  merged + left + right
end

def clever_octopus(fishes)
  max_length = 0
  longest_fish = ""
  fishes.each do |fish|
    if fish.length > max_length
      longest_fish = fish
      max_length = fish.length
    end
  end
  longest_fish
end

def slow_dance(dir, tiles_array)
  tiles_array.each_with_index do |tile, idx|
    return idx if tile == dir
  end
end

tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right"=> 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
}

def fast_dance(dir, tiles_hash)
  tiles_hash[dir]
end
