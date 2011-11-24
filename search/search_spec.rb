# -*- coding: utf-8 -*-
require './search.rb'

describe 'search' do

  context "simple_search_test" do
    
    it "検索対象が存在する場合" do
      "hallo world!".simple_search('world').should == 7
    end

    it "検索対象が存在しない場合" do
      "ABCDE".simple_search('bcd').should == nil
    end

  end

  context "make_slide_table_test" do
    it { String.new.make_slide_table("abc").should == [0, 0, 0] }
  end
  
  context "kmp_search_test" do

    it "検索対象が存在する場合" do
      "abcdefghi".kmp_search('gh').should == 7
    end

    it { "ababc".kmp_search('abc').should == 3 }
    it { "acabc".kmp_search('abc').should == 3 }
    it { "abaac".kmp_search('aac').should == 3 }
    
    it "ムダを省く場合" do
      "abcabcabcda".kmp_search('abcabcd').should == 4
    end
    
    it "検索対象が存在しない場合" do
      "ABCDE".kmp_search('bcd').should == nil
    end

  end

  context "make_slide_table_test" do
    it { String.new.make_slide_hash("abc").should == { "a" => 2, "b" => 1, "c" => 0 } }
    it { String.new.make_slide_hash("baggage").should == { "b" => 6, "a" => 2, "g" => 1, "e" => 0 } }
  end

  context "bm_search_test" do
    
    it "ターゲットにない文字が見つかった場合" do
      "a glowing gleam growing green.".bm_search('gleam').should == 11 
    end
    
    it "不一致を起こした文字がパターンに含まれる場合" do
      "i wind ...".bm_search('wind').should == 3
    end
    
    it "不一致を起こした文字がパターンに複数含まれる場合" do
      "....baggage on".bm_search('baggage').should == 5
    end
    
    it "検索位置が戻ってしまう場合" do
      ".antenna.kana".bm_search('kana').should == 10
    end

    it "検索対象が存在しない場合" do
      "ABCDE".kmp_search('bcd').should == nil
    end
  end

end

