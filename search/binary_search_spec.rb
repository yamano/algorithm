# -*- coding: utf-8 -*-
require './binary_search'

describe Array do
  it '探索したい数値が存在すれば位置を返す' do
    array = [1,2,3]
    ans = 3
    2.should==array.binary_search(ans)
  end

  it '探索したい文字が存在すれば位置を返す' do
    array = %w[a b c]
    ans = 'c'
    2.should==array.binary_search(ans)
  end

  it '探索したい文字が存在しなければ配列のサイズを返す' do
    array = [1,2,3]
    ans = 4
    -1.should==binary.binary_search(ans)
  end

  it '配列の要素数が1つでも探索し位置を返す' do
    array = [1]
    ans = 1
    0.should==array.binary_search(ans)
  end
end
