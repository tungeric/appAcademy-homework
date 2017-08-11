class LRUCache
  def initialize(size)
    @size = size
    @cache = []
  end

  def count
    @cache.count
  end

  def add(el)
    if @cache.include?(el)
      @cache.delete(el)
    elsif count > @size
      @cache.shift
    end
    @cache.push(el)
  end

  def show
    puts @cache
  end

  private
  # helper methods go here!

end
