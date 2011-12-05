# -*- coding: utf-8 -*-
require './knapsacka.rb'

describe 'knapsacka' do
  
  before do
    products = [
                Product.new(2, 2),
                Product.new(3, 4),
                Product.new(5, 7),
                Product.new(6, 10),
                Product.new(9, 14),
               ]
    @knapsacka = Knapsacka.new(products)
  end

  it 'sizeとvalueの初期化テスト' do
    @knapsacka.products[1].size = 3
    @knapsacka.products[1].value = 4
  end

  it 'サイズ16の場合、最適の価値は24である。' do
    @knapsacka.solve(16)
    @knapsacka.total_value(16)
  end

end
