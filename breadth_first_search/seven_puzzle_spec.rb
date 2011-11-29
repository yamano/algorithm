# -*- coding: utf-8 -*-
require './seven_puzzle.rb'

describe 'seven_puzzle' do

  before do
    @puzz = SevenPuzzle.new
    @puzz.puzzle = [[   1,   2,   3,   4],
                    [   5, nil,   6,   7]]
    
    @puzz2 = SevenPuzzle.new
    @puzz2.puzzle = [[   1, nil,   3,   4],
                     [   5,   2,   6,   7]]
  end

  context 'shift_test' do

    it '右と入れ替える' do
      answer = SevenPuzzle.new
      answer.puzzle = [[   1,   2,   3,   4],
                       [   5,   6, nil,   7]]
      
      @puzz.swap(1, 1, 1, 2)
      @puzz.pattern_queue[0].should == answer.puzzle
    end
    
    it '上と入れ替える' do
      answer = SevenPuzzle.new
      answer.puzzle = [[   1, nil,   3,   4],
                       [   5,   2,   6,   7]]
      
      @puzz.swap(1, 1, 0, 1)
      @puzz.pattern_queue[0].should == answer.puzzle
    end
    
    it '左と入れ替える' do
      answer = SevenPuzzle.new
      answer.puzzle = [[   1,   2,   3,   4],
                       [ nil,   5,   6,   7]]
      
      @puzz.swap(1, 1, 1, 0)
      @puzz.pattern_queue[0].should == answer.puzzle
    end
    
    it '下と入れ替える' do
      answer = SevenPuzzle.new
      answer.puzzle = [[   1,   2,   3,   4],
                       [   5, nil,   6,   7]]
      
      @puzz2.swap(0, 1, 1, 1)
      @puzz2.pattern_queue[0].should == answer.puzzle
    end
    
    it '入れ替えたものをキューに入れる' do
      @puzz.swap_number
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
    @puzz3.puzzle = [[   1,   2,   3,   4],
                     [ nil,   5,   6,   7]]

    @puzz4 = SevenPuzzle.new
    @puzz4.puzzle = [[   1, nil,   3,   4],
                     [   5,   2,   6,   7]]

    @puzz5 = SevenPuzzle.new
    @puzz5.puzzle = [[ nil,   2,   3,   4],
                     [   1,   5,   6,   7]]

    @puzz6 = SevenPuzzle.new
    @puzz6.puzzle = [[   4, nil,   3,   2],
                     [   5,   6,   7,   1]]
    
  end

  context '7パズルを解く' do
    it{ @puzz3.solve.should == true }
    it{ @puzz4.solve.should == true }
    it{ @puzz5.solve.should == true }
    #it{ @puzz6.solve.should == true }
  end

end
