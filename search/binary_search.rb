class Array
  def binary_search(target)
    middle = self.size/2
    if self.size >= 1
      if self[middle] == target
        return middle
      elsif self[middle] > target
        answer=self[0...middle].binary_search(target)
        if answer == nil
          return nil
        else
          return answer
        end
      elsif self[middle] < target
        answer =  self[middle+1..-1].binary_search(target)
        if answer == nil
          return nil
        else
          return answer + middle + 1
        end
      end
    end
    nil
  end
end

if $0 == __FILE__
  NUM = 10
  p array = NUM.times.map{|item| rand(10)}.sort
  target = rand(10)
  print "target = #{target}\n"
  if array.binary_search(target) == nil
    puts "failue"
  elsif array[array.binary_search(target)]==target
    print "array[#{array.binary_search(target)}]==#{target} success\n"
  end
end
