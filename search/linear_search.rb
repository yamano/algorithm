class Array
  def linear_search(ans)
    self.size.times do |i|
      if self[i] == ans
        return i
      end
    end
    return self.size
  end
end

if $0 == __FILE__
  NUM = 10
  p array = NUM.times.map{|item| rand(10)}
  p ans = rand(10)
  if array[array.linear_search(ans)] == ans
    puts "success"
  else
    puts "failue"
    # p array[array.linear_search(ans)]
  end
end
