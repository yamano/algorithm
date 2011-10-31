class Array
  def bubblesort
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
  array.bubblesort
  p array
end
