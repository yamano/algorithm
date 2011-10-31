class Sort
  def initialize(array)
    @array = array
  end
  def bubble()
    count=0
    (0...@array.size-1).each do
      (0...@array.size-1-count).each do |i|
        if @array[i] > @array[i+1]
          @array[i],@array[i+1] = @array[i+1],@array[i]
        end
      end
      count+=1
    end
  end
end

if $0 == __FILE__
  NUM=10
  array = Array.new(NUM)
  array.each_index do |i|
    array[i] = rand(100)
    p array[i]
  end
  s = Sort.new(array)
  s.bubble()
  p array
end
