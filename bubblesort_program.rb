class Array
  def bubblesort
    data = Marshal.load(Marshal.dump(self))
    count=0
    (0...data.size-1).each do
      (0...data.size-1-count).each do |i|
        if data[i] > data[i+1]
          data[i],data[i+1] = data[i+1],data[i]
        end
      end
      count +=1
    end
    return data
  end
  def bubblesort!
    count=0
    (0...self.size-1).each do
      (0...self.size-1-count).each do |i|
        if self[i] > self[i+1]
          self[i],self[i+1] = self[i+1],self[i]
        end
      end
      count+=1
    end
  end
end

if $0 == __FILE__
  NUM=10
  p array = (0...NUM).map{|item| rand(100)}
  result = array.bubblesort
  p array
  p result
  array.bubblesort!
  p array
end
