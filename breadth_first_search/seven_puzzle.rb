# -*- coding: utf-8 -*-
class SevenPuzzle

  def initialize
    @pattern = Array.new(2, nil)
    @pattern.each_index do |i|
      @pattern[i] = Array.new(4, nil)
    end
    @pattern_queue = []
    @history_array = []
  end
  attr_accessor :pattern, :pattern_queue, :history_array

  def solve
    swap_four_direction
    @history_array.push(@pattern)
    
    while @pattern_queue != []
      @pattern = @pattern_queue.shift
      if @pattern == [[   1,   2,   3,   4],
                      [   5,   6,   7, nil]]
        return true
      else
        unless @history_array.include?(@pattern)
          @history_array.push(@pattern)
          swap_four_direction
        end
      end
    end
  end
    
  def swap_four_direction
    @pattern.each_index do |i|
      @pattern[i].each_with_index do |item, j|
        unless item
          swap(i, j,     i, j + 1)
          swap(i, j, i - 1,     j)
          swap(i, j,     i, j - 1)
          swap(i, j, i + 1,     j)
        end
      end
    end 
  end

  def swap(i, j, swap_i, swap_j)
    tmp = Marshal.load(Marshal.dump(@pattern))
    
    # 入れ替える対象がパズル内ならばスワップする。
    if swap_j < 4 && swap_i >=0 && swap_j >= 0 && swap_i < 2
 
      tmp[swap_i][swap_j], tmp[i][j] = tmp[i][j], tmp[swap_i][swap_j]
      @pattern_queue.push(tmp)
    end
  end
  
end

if $0 == __FILE__
  puzz = SevenPattern.new
  puzz.pattern = [[2, 7, 1, 4],
                 [5, nil, 3, 6]]

  puzz1 = SevenPattern.new
  puzz1.pattern = [[1, 2, 3, 4],
                  [nil, 5, 6, 7]]

  puzz1.solve
  
end

