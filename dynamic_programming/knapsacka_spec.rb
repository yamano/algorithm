# -*- coding: utf-8 -*-
require './knapsacka.rb'

describe 'knapsacka' do
  before do
    size = [2, 3, 5, 6, 9]
    value = [2, 4, 7, 10, 14]
    @ex = Knapsacka.new(size.map{|i| i}, value.map{|i| i})
    @ex.pack
  end

  it 'sizeとvalueの初期化が正しくできているか' do
    @ex.size == [2, 3, 5, 6, 9]
    @ex.value == [2, 4, 7, 10, 14]
  end
  
  it {@ex.knapsacka_value[0] == [0, 2, 2, 4, 4, 6, 6, 8, 8, 10, 10, 12, 12, 14, 14, 16]}
  
  it {@ex.knapsacka_value == [[0, 2, 2, 4, 4,  6,  6,  8,  8, 10, 10, 12, 12, 14, 14, 16],
                              [0, 2, 4, 4, 6,  8,  8, 10, 12, 12, 14, 16, 16, 18, 20, 20],
                              [0, 2, 4, 4, 7,  8,  9, 11, 12, 14, 15, 16, 18, 19, 21, 22],
                              [0, 2, 4, 4, 7, 10, 10, 12, 14, 14, 17, 20, 20, 22, 24, 24],
                              [0, 2, 4, 4, 7, 10, 10, 12, 14, 14, 17, 20, 20, 22, 24, 24]]
  }

  it '' do
    @ex.pack == 24
  end

end
