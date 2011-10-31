# -*- coding: utf-8 -*-
require './bubble_sort'

describe Array do
  it 'can sort' do
    array=[3,2,1]
    array.bubblesort
    array.should==[1,2,3]
  end
end
=begin
  it 'can sort string' do
    @sort = %w[ c b a ]

    Sort.new(@sort).bubble
    @sort.should == %w[a b c]
  end

  it '配列の中身が1つのときそのままの値を返す' do
    @sort = [1]
    Sort.new(@sort).bubble()
    @sort.should == [1]
  end

  it '配列が空のとき空のまま返す' do
    @sort = []
    Sort.new(@sort).bubble()
    @sort.should == []
  end

  it '同じ値が複数あったときもちゃんとソートされる' do
    @sort = [7,8,8,3,4,2,2,9]
    Sort.new(@sort).bubble()
    @sort.should == [2,2,3,4,7,8,8,9]
  end

  it '文字と数字が混ざっているとき' do
    array = [c,3,b,2,a,1]
    array.bubblesort
    @sort.should == [a,b,c,1,2,3]
  end

  it 'ソートのできないオブジェクトをソートするときエラーを返す' do
    hash = [ { :a => :b }, { :b => :c } ]
    expect {Sort.new(hash).bubble()}.to raise_exception
  end
  
  it '二重配列をソートするときエラーを返す' do
    @sort = [ [2,3],[5,4] ]
    expect {Sort.new(@sort).bubble()}.to raise_exception
  end

  it '複素数をソートするときエラーを返す' do
    @sort = [Complex(1,3),Complex(3,2)]
    expect{Sort.new(@sort).bubble()}.to raise_exception
  end

end
=end
