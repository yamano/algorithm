# -*- coding: utf-8 -*-
require './simple_search.rb'

describe 'search' do
  it { "abcde".simple_search('bc').should == true }

  it { "abcde".simple_search('fg').should == false }

  it { "hallo world!".simple_search('world').should == true }

  it { "ABCDE".simple_search('bcd').should == false }

  it { "abcdefghi".kmp_search('gh').should == true }

  it { "abcdefghi".kmp_search('fg').should == true }

  it { "abcabckkabcabcdefg".kmp_search('abcabcd').should == true }

  it { "abcabcabcabcdefg".kmp_search('abcabcd').should == true }

  it { "abcabcabcda".kmp_search('abcabcd').should == true }

  it { "ABCDE".kmp_search('bcd').should == false }

  it 'ターゲットにない文字が見つかった場合' do
    "a glowing gleam growing green.".bm_search('gleam').should == true 
  end

  it "不一致を起こした文字がパターンに含まれる場合" do
    "i wind ???".bm_search('wind').should == true 
  end

  it "不一致を起こした文字がパターンに複数含まれる場合" do
    "....baggage on".bm_search('baggage').should == true 
  end

  it "検索位置が戻ってしまう場合" do
    ".antenna.kana".bm_search('kana').should == true 
  end
end

