# -*- coding: utf-8 -*-
$LOAD_PATH << File.dirname(__FILE__)
require 'bubble_sort'

describe Array do
  it 'can sort' do
    array=[3,2,1]
    result=array.bubble_sort
    result.should==[1,2,3]
  end

  it 'can sort string' do
    array = %w[ c b a ]

    result=array.bubble_sort
    result.should == %w[a b c]
  end

  it '配列の中身が1つのときそのままの値を返す' do
    array = [1]
    result=array.bubble_sort
    result.should == [1]
  end

  it '配列が空のとき空のまま返す' do
    array = []
    result=array.bubble_sort
    result.should == []
  end

  it '同じ値が複数あったときもちゃんとソートされる' do
    array = [7,8,8,3,4,2,2,9]
    result=array.bubble_sort
    result.should == [2,2,3,4,7,8,8,9]
  end

  it '文字と数字が混ざっているときエラーを返す' do
    array = ['a',1]
    expect {result=array.bubble_sort}.to raise_exception
  end

  it 'nilが含まれているときエラーを返す' do
    array = [2,1,nil]
    expect {result = array.buble_sort}.to raise_exception
  end

  it 'ソートのできないオブジェクトをソートするときエラーを返す' do
    hash = [ { :a => :b }, { :b => :c } ]
    expect {array.bubble_sort}.to raise_exception
  end
  
  it '二重配列をソートするときエラーを返す' do
    array = [ [2,3],[5,4] ]
    expect {array.bubble_sort}.to raise_exception
  end

  it '複素数をソートするときエラーを返す' do
    array = [Complex(1,3),Complex(3,2)]
    expect{array.bubble_sort}.to raise_exception
  end

end
