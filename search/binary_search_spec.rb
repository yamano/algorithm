# -*- coding: utf-8 -*-
require './binary_search'

describe Array do
  it '探索したい数値が存在すれば位置を返す' do
    array = [1,2,3]
    target = 3
    array.binary_search(target).should == 2
  end

  it '探索したい文字が存在すれば位置を返す' do
    array = %w[a b c]
    target = 'c'
    array.binary_search(target).should == 2
  end

  it '探索したい文字が存在しなければnilを返す' do
    array = [1,2,3]
    target = 4
    array.binary_search(target).should == nil
  end

  it '配列の要素数が1つでも探索し位置を返す' do
    array = [1]
    target = 1
    array.binary_search(target).should == 0
  end

  it '探索したい数値が重複する場合、一番左の位置を返す' do
    array = [1,3,3,3,3,3,4]
    target = 3
    array.binary_search(target).should == 1
  end

end
