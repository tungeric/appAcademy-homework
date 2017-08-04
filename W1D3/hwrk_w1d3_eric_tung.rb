def sum_to(n)
  return 1 if n==1
  n + sum_to(n-1)
end

def add_numbers(nums_array)
  return nums_array[0] if nums_array.length<=1
  nums_array.last + add_numbers(nums_array[0..-2])
end

def gamma_fnc(n)
  return nil if n<=0
  return 1 if n<=2
  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.first == favorite
  ice_cream_shop(flavors[1..-1],favorite)
end

def reverse(string)
  return string if string.length<=1
  string[-1] + reverse(string[0..-2])
end
