class Array
  def linear_search(target)
    self.each_with_index do |item,index|
      if item == target
        return index
      end
    end
    nil
  end
end

if $0 == __FILE__
  NUM = 10
  p array = NUM.times.map{|item| rand(10)}
  target = rand(10)
  print "target = #{target}\n"
  if array.linear_search(target)
    print "array[#{array.linear_search(target)}] == #{target} success\n"
  else
    puts "failue"
  end
end
