# -*- coding: utf-8 -*-
require 'benchmark'

class Array
  #　無限ループする可能性がある
  def quick_sort(&block)
    if self.uniq.size > 1
      threshold = yield(self)

      self.partition {|i| i <= threshold }.map do |array|
        array.quick_sort(&block)
      end.flatten
    else
      self
    end
  end

  def quick_sort!(&block)
    self.replace(self.quick_sort(&block))
  end
end

if $0 == __FILE__
  NUM=10
  p array = NUM.times.map {|item| rand(100) }
  p array.quick_sort {|array| array.sample }


  n =1000000
  Benchmark.bm(15) do |x|
    x.report("my_quick_sort:"){
      array=n.times.map{|item| rand(100)}
      array.quick_sort{|array| array.sample}
    }
    x.report("quick_sort:"){
      array=n.times.map{|item| rand(100)}
      array.sort
      }
  end
end
