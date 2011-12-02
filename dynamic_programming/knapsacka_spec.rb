# -*- coding: utf-8 -*-
require './knapsacka.rb'

describe 'knapsacka' do
  before do
    size  = [2, 3, 5, 6, 9]
    value = [2, 4, 7, 10, 14]
    @ex = Knapsacka.new(size.map{|i| i}, value.map{|i| i})
    @ex.solve
  end

  it 'sizeとvalueの初期化テスト' do
    @ex.size.should == [2, 3, 5, 6, 9]
    @ex.value.should == [2, 4, 7, 10, 14]
  end

  it '扱う商品を増やしていったときの最適解' do  
    # @ex.knapsacka.should == [0, 2, 4, 4, 7, 10, 10, 12, 14, 14, 17, 20, 20, 22, 24, 24]
  end

  it '今回の商品の組み合わせで最高の価値となる24が返ってくる' do
    # @ex.knapsacka[15].should == 24
  end

  it '' do
    @ex.solve.should == [{2=>0}, {2=>1}, {4=>1}, {2=>2}, {7=>1}, {10=>1},
                         {2=>0, 10=>1}, {2=>1, 10=>1}, {4=>1, 10=>1}, {7=>2}, {7=>1, 10=>1},
                         {10=>2}, {2=>0, 10=>2}, {2=>1, 10=>2}, {4=>1, 10=>2}, {7=>2, 10=>1}]
    
  end

end
