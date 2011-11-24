# -*- coding: utf-8 -*-
require './simple_search.rb'

describe 'search' do

  context "simple_search_test" do
    
    it "検索対象が存在する場合" do
      "hallo world!".simple_search('world').should == true
    end

    it "検索対象が存在しない場合" do
      "ABCDE".simple_search('bcd').should == false
    end

  end

  context "kmp_search_test" do

    it "検索対象が存在する場合" do
      "abcdefghi".kmp_search('gh').should == true
    end

    it { "ababc".kmp_search('abc').should == true }
    it { "acabc".kmp_search('abc').should == true }
    it { "abaac".kmp_search('aac').should == true }
    
    it "ムダを省く場合" do
      "abcabcabcda".kmp_search('abcabcd').should == true
    end
    
    it "検索対象が存在しない場合" do
      "ABCDE".kmp_search('bcd').should == false 
    end

  end

  context "bm_search_test" do
    
    it "ターゲットにない文字が見つかった場合" do
      "a glowing gleam growing green.".bm_search('gleam').should == true 
    end
    
    it "不一致を起こした文字がパターンに含まれる場合" do
      "i wind ...".bm_search('wind').should == true 
    end
    
    it "不一致を起こした文字がパターンに複数含まれる場合" do
      "....baggage on".bm_search('baggage').should == true 
    end
    
    it "検索位置が戻ってしまう場合" do
      ".antenna.kana".bm_search('kana').should == true 
    end

    it "検索対象が存在しない場合" do
      "ABCDE".kmp_search('bcd').should == false
    end
  end

end

