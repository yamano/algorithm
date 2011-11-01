# -*- coding: utf-8 -*-
class Array
  #　無限ループする可能性がある
  def quick_sort(&block)
    if self.uniq.size > 1
      threshold = yield(self)

      self.partition {|i| i <= threshold }.map do |array|
        array.quick_sort{|item| array.sample}
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
  NUM = 10
  p array = NUM.times.map{|item| rand(100)}
  p array.quick_sort{|array| array.sample}
end
