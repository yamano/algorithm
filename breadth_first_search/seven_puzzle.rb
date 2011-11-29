class SevenPuzzle

  def initialize
    @puzzle = Array.new(2, nil)
    @puzzle.each_index do |i|
      @puzzle[i] = Array.new(4, nil)
    end
    @pattern_queue = []
    @history_queue = []
  end
  attr_accessor :puzzle, :pattern_queue, :history_queue

  def solve
    swap_number
    @history_queue.push(@puzzle)
    while pattern_queue
    
      @puzzle = pattern_queue.shift
      @history_queue.push(@puzzle)
      if @puzzle == [[   1,   2,   3,   4],
                     [   5,   6,   7, nil]]
        return true
      else
        swap_number
      end
    end
  end
    
  def swap_number
    @puzzle.each_index do |i|
      @puzzle[i].each_with_index do |item, j|
        if item == nil
          swap(i, j,     i, j + 1)
          swap(i, j, i - 1,     j)
          swap(i, j,     i, j - 1)
          swap(i, j, i + 1,     j)
        end
      end
    end 
  end

  def push_tmp(tmp)
    if @history_pueue
      return if @history_pueue.include?(tmp)
    end
    @pattern_queue.push(tmp)
  end

  def swap(i, j, swap_i, swap_j)
    tmp = Marshal.load(Marshal.dump(@puzzle))
    if swap_j < 4 && swap_i >=0 && swap_j >= 0 && swap_i < 2 
      tmp[swap_i][swap_j], tmp[i][j] = tmp[i][j], tmp[swap_i][swap_j]
      
      push_tmp(tmp)
    end
  end
  
end

if $0 == __FILE__
  puzz = SevenPuzzle.new
  puzz.puzzle = [[2, 7, 1, 4],
                 [5, nil, 3, 6]]

  puzz.solve
  
end
