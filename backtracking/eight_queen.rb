# -*- coding: utf-8 -*-
class EightQueen
  
  def initialize
    @board = Array.new(8, false)
    @board.each_index do |i|
      @board[i] = Array.new(8, false)
    end
    @answer_array = []
  end
  attr_accessor :board ,:answer_array

  def check(x, y) 
    #左方向
    x.times do |i|
      return false if @board[i][y]
    end
    
    #左上方向
    short =  x > y ? y : x 
    short.times do |i|
      return false if @board[x - i - 1][y - i -1]
    end
      
    #左下方向
    short = x > 8 - y ? 8 - y : x
    short.times do |i|
      return false if @board[x - i - 1][y + i + 1]
    end

    true
  end

  def solve(x)
    if x == 8
      board_data =  Marshal.load(Marshal.dump(@board))
      @answer_array.push(board_data)
      return false
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
  a = EightQueen.new
  a.solve(0)
  p a.answer_array.size
end
