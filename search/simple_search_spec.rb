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

end

