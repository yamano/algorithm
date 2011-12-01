# -*- coding: utf-8 -*-
class SevenPuzzle

  def initialize
    @pattern = 4.times.map{Array.new(2)}
    @pattern_queue = []
    @pattern_history = []
  end
  attr_accessor :pattern, :pattern_queue, :history_array

  def solve
    @pattern_queue.push(@pattern)
    
    while @pattern = @pattern_queue.shift
      if @pattern == [[   1,   2,   3,   4],
                      [   5,   6,   7, nil]]
        #Todo 返り値はステップ数にしたかったが保留中
        return true                                
      else
        unless @pattern_history.include?(@pattern)
          @pattern_history.push(@pattern)
          search_next_pattern
        end
      end
    end
    nil
  end
    
  def search_next_pattern
    # nilの位置を探す。
    tmp_i = 0;
    tmp_j = 0;
    @pattern.each_index do |i|
      @pattern[i].each_with_index do |item, j|
        unless item
          tmp_i, tmp_j = i, j
          break
        end
      end
    end

    # 4方向を調べて、入れ替える対象がパズル内ならばスワップする。
    swap_right(tmp_i, tmp_j)
    swap_up(tmp_i, tmp_j)
    swap_left(tmp_i, tmp_j)
    swap_down(tmp_i, tmp_j)
  end
  
  def swap(i, j, swap_i, swap_j)
    tmp = Marshal.load(Marshal.dump(@pattern))
    
    # 入れ替える対象がパズル内ならばスワップする。
    if swap_j < 4 && swap_i >=0 && swap_j >= 0 && swap_i < 2
 
      tmp[swap_i][swap_j], tmp[i][j] = tmp[i][j], tmp[swap_i][swap_j]
      @pattern_queue.push(tmp)
    end
  end

  def swap_right(i, j)
    swap(i, j, i, j + 1)
  end

  def swap_up(i, j)
    swap(i, j, i - 1, j)
  end

  def swap_left(i, j)
    swap(i, j, i, j - 1)
  end

  def swap_down(i, j)
    swap(i, j, i + 1, j)
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

