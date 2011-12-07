# -*- coding: utf-8 -*-
require "./rpn.rb"

describe "calculate_rpn" do

  before do
    @str1 = "58+"
    @str2 = "5831+/*"
    @str3 = "@"
  end

  it "5.0 + 8.0 が計算されて 13.0 が出力される" do
    @str1.calculate_rpn.should == 13.0
  end

  it "5.0 * 8.0 / (3.0 + 1.0) が計算されて 10.0 が出力される" do
    @str2.calculate_rpn.should == 10.0
  end

  it "不適切な記号が入力されたらエラーを返す" do
    expect {@str3.calclate_rpn}.to raise_exception
  end

end

describe "make_rpn_pattern_array" do
  
  before do
    @str = "1234"
    @str1 = "12345"
  end


  it '逆ポーランド記法で解ける形で作られる最初のパターンと最後のパターンをテスト' do
    @str.make_rpn_string_array[0].should == "1234+++"
    @str.make_rpn_string_array[-1].should == "43/2/1/"
  end

  it '文字列が4つではない場合、エラーを返す' do
    expect {@str1.calclate_rpn}.to raise_exception
  end

  it '4つの数字から逆ポーランド記法が使えるパターンを作ると重複無しで6144個作られる' do
    @str.make_rpn_string_array.uniq.size.should == 6144
  end

end

describe "solve" do
  
  before do
    @str = "1234"
    @str1 = "1111"
  end

  it "" do
    @str.solve_puzzle(10)[0].should == "1234+++"
  end

  it "1111の数字からは10を作れないので配列は空で返される" do
    @str1.solve_puzzle(10).should == []
  end

end

