class EightQueen
  
  def initialize
    @board = Array.new(8, false)
    @board.each_index do |i|
      @board[i] = Array.new(8, false)
    end
    
  end
  attr_accessor :board 

  def check(x, y)    
    x.times do |i|
      return false if @board[i][y]
    end
    
    short =  x > y ? y : x 
    short.times do |i|
      return false if @board[x - i - 1][y - i -1]
    end
      
    short = x > 8 - y ? 8 - y : x
    short.times do |i|
      return false if @board[x - i - 1][y + i + 1]
    end

    true
  end

  def solve(x)
    if x == 8
      # @answer_array.push(@board)
      return true
    end
    @board[x].each_index do |i|
      if check(x, i)
        @board[x][i] = true
        if solve(x + 1)
          return true
        else
          @board[x][i] = false
        end
      end
    end
    return false
  end
  
end

if $0 == __FILE__
  #p board = EightQueen.new
  #a=Array.new(8, nil)
  #p a[0] = Array.new(8, nil)
  #p a[0][0]
  a = EightQueen.new
  #p a
  #p a.check(3, 3)
  a.solve(0)
  #p a.board[0][2]
  p a.answer_array.size
end
