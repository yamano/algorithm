# -*- coding: utf-8 -*-
class EightQueen
  
  # クイーンを置いている位置をtrue、置いてない位置をnilとする。
  def initialize
    @board = 8.times.map{Array.new(8)}
    @answer_array = []
  end
  attr_accessor :board ,:answer_array

  def check(x, y) 
    # ボード内にいなければ例外を通知する。
    if x > 7 || y > 7 || x < 0 || y < 0
      raise
    end

    #左方向
    x.times do |i|
      return nil if @board[i][y]
    end
    
    #左上方向
    short =  x > y ? y : x 
    short.times do |i|
      return nil if @board[x - i - 1][y - i -1]
    end
      
    #左下方向
    y_under = 8 - y
    short = x > y_under ? y_under : x
    short.times do |i|
      return nil if @board[x - i - 1][y + i + 1]
    end

    true
  end

  def solve(x)
    if x == 8
      board_data =  Marshal.load(Marshal.dump(@board))
      @answer_array.push(board_data)
      return nil
    end
    @board[x].each_index do |i|
      if check(x, i)
        @board[x][i] = true
        # 右隣りにクイーンを置ける場所がなかったら現在、置いているクイーンが間違いなのでnilにする。
        @board[x][i] = nil unless solve(x + 1)
      end
    end
    # ループを抜けたらその列に解はないのでnilを返す。
    return nil
  end
  
end

if $0 == __FILE__
  a = EightQueen.new
  a.solve(0)
  p a.answer_array.size
end
