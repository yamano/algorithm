# -*- coding: utf-8 -*-
require './knapsacka.rb'

describe 'knapsacka' do
  before do
    size  = [2, 3, 5, 6, 9]
    value = [2, 4, 7, 10, 14]
    @ex = Knapsacka.new(size, value)
    @ex.solve
  end

  it 'sizeとvalueの初期化テスト' do
    @ex.size.should == [2, 3, 5, 6, 9]
    @ex.value.should == [2, 4, 7, 10, 14]
  end

  it '全ての種類の商品を使った場合の最適解を出したときのサイズと個数の関係のテスト' do
    @ex.solve.should == [{2=>0}, {2=>1}, {4=>1}, {2=>2}, {7=>1}, {10=>1},
                         {2=>0, 10=>1}, {2=>1, 10=>1}, {4=>1, 10=>1}, {7=>2}, {7=>1, 10=>1},
                         {10=>2}, {2=>0, 10=>2}, {2=>1, 10=>2}, {4=>1, 10=>2}, {7=>2, 10=>1}]
    
  end

end
