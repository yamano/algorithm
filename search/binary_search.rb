class Array
  def binary_search(ans)
    mid = self.size/2
    if self.size >= 1
      if self[mid] == ans
        return mid
      elsif self[mid] > ans
        array =  self[0...mid]
        return array.binary_search(ans)
      elsif self[mid] < ans
        array =  self[mid+1...self.size]
        return array.binary_search(ans) + mid + 1
      end
    end
    mid
  end
end

if $0 == __FILE__
  NUM = 10
  p array = NUM.times.map{|iten| rand(10)}.sort
  p ans = rand(10)
  if array[array.binary_search(ans)] == ans
    puts "success"
  else
    p array.binary_search(ans)
    puts "failue"
  end
end
