require 'byebug'

#recursion
def range(start_num, end_num)                    
  return [] if end_num <= start_num
  [start_num] + range(start_num + 1, end_num)
end

#iteraton
def it_range(start_num,end_num)
  new_arr = []
  (start_num...end_num).each {|i| new_arr << i}
  new_arr
end

def exponent(b, num)
  return 1 if num == 0
  b * exponent(b,num - 1)
end

def exp(base, exponent)
  return 1 if exponent==0
  return base if exponent==1
  if exponent.even?
    return exp(base, exponent/2)**2
  else
    return base*(exp(base,(exponent-1)/2)**2)
  end
end


def fibbonacci(n) 
  return [0] if n ==1 
  return [0,1] if n ==2 
  temp= fibbonacci(n-1)
  temp << temp[-1] + temp[-2]
end


def binary(array,target)
  value = array.length / 2
  return value if array[value] == target
  return nil if array.length == 1 && array[value] != target
  if array[value] < target
    return 1 + value + binary(array[value+1..-1], target)
  else
    binary(array[0...value], target)
  end
end






# p binary([1, 2, 3], 1) # => 0
# p binary([2, 3, 4, 5], 3) # => 1
# p binary([2, 4, 6, 8, 10], 6) # => 2
# p binary([1, 3, 4, 5, 9], 5) # => 3
# p binary([1, 2, 3, 4, 5, 6], 6) # => 5
# p binary([1, 2, 3, 4, 5, 6], 0) # => nil
# p binary([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(array)
  return [] if array.length == 0
  return array if array.length == 1
  half = array.length / 2
  left = array[0...half]
  right = array[half..-1]
  
  merge(merge_sort(left), merge_sort(right))
end

def merge(arr1, arr2)
  len1 = arr1.length
  len2 = arr2.length
  ans = []
  while arr1.length > 0 && arr2.length > 0
    if arr1[0] < arr2[0]
      ans << arr1.shift
    else
      ans << arr2.shift
    end
  end
  ans + arr1 + arr2
end

# p merge_sort([38,27,43,3,9,82,10])


def deep_dup(array)
  new_arr = []
  array.each do |ele|
    if ele.is_a?(Array)
      new_arr << deep_dup(ele)
    else
      new_arr << ele
    end
  end
  new_arr
end


def permutations(array)
  
  return array if array.length < 2

  array.each_with_index do |ele, i|
    [ele] + permutations(array[0...i] + array[i+1..-1])
  end
  ans
end

p permutations([1, 2, 3])



