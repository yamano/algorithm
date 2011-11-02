# -*- coding: utf-8 -*-
require './linear_search'

describe Array do
  it '探索したい数値が存在すれば位置を返す' do
    array = [1,2,3]
    ans = 3
    array.linear_search(ans).should==2
  end

  it '探索したい文字が存在すれば位置を返す' do
    array = %w[a b c]
    ans = 'c'
    array.linear_search(ans).should==2
  end

  it '探索したい文字が存在しなければnilを返す' do
    array = [1,2,3]
    ans = 4
    array.linear_search(ans).should==nil
  end

  it '配列の要素数が1つでも探索し位置を返す' do
    array = [1]
    ans = 1
    array.linear_search(ans).should==0
  end
end
