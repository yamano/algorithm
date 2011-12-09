# -*- coding: utf-8 -*-
require "./rpn.rb"

describe "calculate_rpn" do

  context "想定している数字、記号が入力された場合" do
    
    before do
      @rpn1 = Rpn.new([5, 8, "+"])
      @rpn2 = Rpn.new([5, 8, 3, 1, "+", "/", "*"])
      @rpn3 = Rpn.new([1, 2, 3, 4, 5, "+", "+", "+", "+"])
    end
    
    it "5.0 + 8.0 が計算されて 13.0 が出力される" do
      @rpn1.calculate_rpn(@rpn1.array).should == 13.0
    end
    
    it "5.0 * 8.0 / (3.0 + 1.0) が計算されて 10.0 が出力される" do
      @rpn2.calculate_rpn(@rpn2.array).should == 10.0
    end

    it "1.0 + 2.0 + 3.0 + 4.0 + 5.0  が計算されて 15.0 が出力される" do
      @rpn3.calculate_rpn(@rpn3.array).should == 15.0
    end

  end

  context "想定していない記号が入力された場合" do
    
    before do
      @rpn4 = Rpn.new(["@"])
      @rpn5 = Rpn.new([","])
    end
    
    it "不適切な記号が入力されたらエラーを返す" do
      expect {@rpn4.calclate_rpn(@rpn4)}.to raise_exception
      expect {@rpn5.calclate_rpn(@rpn5)}.to raise_exception
    end

  end

end

describe "make_rpn_pattern_array" do
  
  context "数字4つの場合" do

    before do
      @rpn1 = Rpn.new([1, 2, 3, 4])

      @solver = PuzzleSolver.new
    end
    
    it '逆ポーランド記法で解ける形で作られる最初のパターンと最後のパターンをテスト' do
      @solver.make_rpn_pattern_array(@rpn1.array)[0].should == [1, 2, 3, 4, "+", "+", "+"]
      @solver.make_rpn_pattern_array(@rpn1.array)[-1].should == [4, 3, "/", 2, "/", 1, "/"]
    end
    
    it '4つの数字から逆ポーランド記法が使えるパターンを作ると重複無しで6144個作られる' do
      @solver.make_rpn_pattern_array(@rpn1.array).uniq.size.should == 6144
    end
  
  end

  context "数字4つではない場合" do

    before do
      @rpn2 = Rpn.new([1, 2, 3, 4, 5])
      @rpn3 = Rpn.new([1, 2, 3])
      @solver = PuzzleSolver.new
    end

    it '文字列が4つではない場合、エラーを返す' do
      expect {@solver.make_rpn_pattern_array(@rpn2.array)}.to raise_exception
      expect {@solver.make_rpn_pattern_array(@rpn3.array)}.to raise_exception
    end

  end

end

describe "solve" do
  
  before do
    @rpn = Rpn.new([1, 2, 3, 4])
    @rpn1 = Rpn.new([1, 1, 1, 1])
    @solver = PuzzleSolver.new
  end

  it "" do
    @solver.solve_puzzle(@rpn, 10)[0].should == [1, 2, 3, 4, "+", "+", "+"]
  end

  it "1111の数字からは10を作れないので配列は空で返される" do
    @solver.solve_puzzle(@rpn1, 10).should == []
  end

end

