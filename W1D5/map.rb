class Map
  def initialize
    @map =[]
  end

  def assign(key,value)
    pair_index = @map.index {|pair| pair[0] == key}
    pair_index ? @map[pair_index][1] = value : @map << [key, value]
    [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair [1] if pair[0] == key }
    nil
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
    nil
  end

  def show
    array_dup(@map)
  end

  def array_dup(array)
    array.map { |el| el.is_a?(Array) ? array_dup(el) : el }
  end

end

a = Map.new
a.assign(25, "Simmons")
a.assign(21, "Embiid")
a.assign(20, "Fultz")
p a.show
p a.lookup(21)
a.remove(20)
p a.show
