# -*- coding: utf-8 -*- 
require 'benchmark'
require './quick_sort'

n = ($*.first).to_i
Benchmark.bm(15) do |x|
  x.report("my_quick_sort:"){
    array=n.times.map{|item| rand(n)}
    array.quick_sort{|array| array.sample}
  }
  x.report("quick_sort:"){
    array=n.times.map{|item| rand(n)}
    array.sort
  }
end
