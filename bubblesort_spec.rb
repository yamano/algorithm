# -*- coding: utf-8 -*-
require './BubbleTest'

describe Sort do
  it 'can sort' do
    @sort=[3,2,1]
    result=[1,2,3]
    Sort.new(@sort).bubble()
    @sort.should==result
  end

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
