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

describe "make_rpn" do

end
