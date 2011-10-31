class Array
  def bubble_sort
    #data = Marshal.load(Marshal.dump(self)) # deep copy
    data = self.dup # sharrow copy

    (self.size-1).times do |i|
      (self.size-1-i).times do |j|
        if data[j] > data[j+1]
          data[j],data[j+1] = data[j+1],data[j]
        end
      end
    end
    data
  end

  def bubble_sort!
    self.replace(self.bubble_sort)
  end
end

if $0 == __FILE__
  NUM=10
  p array = (0...NUM).map{|item| rand(100)}
  result = array.bubble_sort
  p array
  p result
  array.bubble_sort!
  p array
end
