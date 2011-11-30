# -*- coding: utf-8 -*-
require './eight_queen.rb'

describe 'checkメソッドのテスト' do

  before do
    @e_q = EightQueen.new
    @e_q.board[0][0] = true
    @e_q.board[0][3] = true
    @e_q.board[0][7] = true
  end

  it 'ボード上にいない場合は例外を返す。' do
    expect { @e_q.check(0, 8)  }.to raise_exception
    expect { @e_q.check(-1, 0) }.to raise_exception
  end
  
  it '左にすでにクイーンが置いてある場合はfalseを返す。' do
    @e_q.check(5, 3).should == nil
  end

  it '左上にすでにクイーンが置いてある場合はfalseを返す。' do
    @e_q.check(1, 1).should == nil
    @e_q.check(4, 7).should == nil
  end

  it '左下にすでにクイーンが置いてある場合はfalseを返す。' do
    @e_q.check(5, 2).should == nil
    @e_q.check(1, 6).should == nil
  end

  it 'クイーンを置いてもお互い取れない場合はtrueを返す。' do
    @e_q.check(7, 6).should == true
    @e_q.check(6, 2).should == true
  end

end

describe 'EightQueen' do
  
  before do
    @e_q = EightQueen.new
    @e_q.solve(0)
  end

  it 'solve_test' do
    @e_q.answer_array[0].should == [[true, nil, nil, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, nil, true, nil, nil, nil],
                                   [nil, nil, nil, nil, nil, nil, nil, true],
                                   [nil, nil, nil, nil, nil, true, nil, nil],
                                   [nil, nil, true, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, nil, nil, nil, true, nil],
                                   [nil, true, nil, nil, nil, nil, nil, nil],
                                   [nil, nil, nil, true, nil, nil, nil, nil]]
  end

  it 'multi_solve_test' do
    @e_q.answer_array.size.should == 92
  end

end
