# -*- coding: utf-8 -*-
require './seven_puzzle.rb'

describe 'seven_puzzle' do

  before do
    @puzz = SevenPuzzle.new
    @puzz.pattern = [[   1,   2,   3,   4],
                    [   5, nil,   6,   7]]
    
    @puzz2 = SevenPuzzle.new
    @puzz2.pattern = [[   1, nil,   3,   4],
                     [   5,   2,   6,   7]]
  end

  context '各方向と入れ替わっているかのテスト' do

    it '右と入れ替える' do
      answer = SevenPuzzle.new
      answer.pattern = [[   1,   2,   3,   4],
                       [   5,   6, nil,   7]]
      
      @puzz.swap_right(1, 1)
      @puzz.pattern_queue[0].should == answer.pattern
    end
    
    it '上と入れ替える' do
      answer = SevenPuzzle.new
      answer.pattern = [[   1, nil,   3,   4],
                       [   5,   2,   6,   7]]
      
      @puzz.swap_up(1, 1)
      @puzz.pattern_queue[0].should == answer.pattern
    end
    
    it '左と入れ替える' do
      answer = SevenPuzzle.new
      answer.pattern = [[   1,   2,   3,   4],
                       [ nil,   5,   6,   7]]
      
      @puzz.swap_left(1, 1)
      @puzz.pattern_queue[0].should == answer.pattern
    end
    
    it '下と入れ替える' do
      answer = SevenPuzzle.new
      answer.pattern = [[   1,   2,   3,   4],
                       [   5, nil,   6,   7]]
      
      @puzz2.swap_down(0, 1)
      @puzz2.pattern_queue[0].should == answer.pattern
    end
    
    it '入れ替えたものをキューに入れる' do
      @puzz.search_next_pattern
      @puzz.pattern_queue.should == [[[   1,   2,   3,   4],
                                      [   5,   6, nil,   7]],
                                     
                                     [[   1, nil,   3,   4],
                                      [   5,   2,   6,   7]],
                                     
                                     [[   1,   2,   3,   4],
                                      [ nil,   5,   6,   7]]]
    end
  end

  before do
    @puzz3 = SevenPuzzle.new
    @puzz3.pattern = [[   1,   2,   3,   4],
                     [ nil,   5,   6,   7]]

    @puzz4 = SevenPuzzle.new
    @puzz4.pattern = [[   1, nil,   3,   4],
                     [   5,   2,   6,   7]]

    @puzz5 = SevenPuzzle.new
    @puzz5.pattern = [[ nil,   2,   3,   4],
                     [   1,   5,   6,   7]]

    @puzz6 = SevenPuzzle.new
    @puzz6.pattern = [[   1,   2,   3,   4],
                      [   5,   6,   7, nil]]
    
  end

  context '7パズルを解く' do
    it{ @puzz3.solve.should == true }
    it{ @puzz4.solve.should == true }
    it{ @puzz5.solve.should == true }
    it{ @puzz6.solve.should == true }
  end

end
