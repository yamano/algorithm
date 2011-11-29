class SevenPuzzle

  def initialize
    @puzzle = Array.new(2, nil)
    @puzzle.each_index do |i|
      @puzzle[i] = Array.new(4, nil)
    end
    @pattern_queue = []
  end
  attr_accessor :puzzle, :pattern_queue

  def solve
    swap_number
    while pattern_queue
      @puzzle = pattern_queue.shift
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
          swap_right(i, j)
          swap_up(i, j)
          swap_left(i, j)
          swap_down(i, j)
        end
      end
    end 
  end

  def swap_right(i, j)
    tmp = Marshal.load(Marshal.dump(@puzzle))
    if j + 1 < 4
      tmp[i][j + 1], tmp[i][j] = tmp[i][j], tmp[i][j + 1]
      @pattern_queue.push(tmp)
    end
  end

  def swap_up(i, j)
    tmp = Marshal.load(Marshal.dump(@puzzle))
    if i -1 >= 0
      tmp[i - 1][j], tmp[i][j] = tmp[i][j], tmp[i - 1][j]
      @pattern_queue.push(tmp)
    end
  end

  def swap_left(i, j)
    tmp = Marshal.load(Marshal.dump(@puzzle))
    if j - 1 >= 0
      tmp[i][j - 1], tmp[i][j] = tmp[i][j], tmp[i][j - 1]
      @pattern_queue.push(tmp)
    end
  end

  def swap_down(i, j)
    tmp = Marshal.load(Marshal.dump(@puzzle))
    if i + 1 < 2
      tmp[i + 1][j], tmp[i][j] = tmp[i][j], tmp[i + 1][j]
      @pattern_queue.push(tmp)
    end
  end

end

if $0 == __FILE__
  puzz = SevenPuzzle.new

  puzz.puzzle = [[1, 2, nil, 4],
                 [5, 6, 3, 7]]

  p puzz.solve
end
