# -*- coding: utf-8 -*-
require './simple_search.rb'

describe 'simple_search' do
  it { "abcde".simple_search('bc').should == true }

  it { "abcde".simple_search('fg').should == false }

  it { "hallo world!".simple_search('world').should == true }

  it { "ABCDE".simple_search('bcd').should == false }
end
