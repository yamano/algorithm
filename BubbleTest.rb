class Sort
  def initialize(sort)
    @sort = sort
  end
  def bubble()
    loop do
      flag = 0
      (0...@sort.size-1).each do |i|
        if @sort[i] > @sort[i+1]
          flag = 1
          @sort[i],@sort[i+1] = @sort[i+1],@sort[i]
        end
      end
      break if flag == 0
    end
  end
end

if $0 == __FILE__
  NUM=10
  sort = Array.new(NUM)
  sort.each_index do |i|
    sort[i] = rand(100)
    p sort[i]
  end
  s = Sort.new(sort)
  s.bubble()
  p sort
end
