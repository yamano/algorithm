# -*- coding: utf-8 -*-
class Array  
  def initialize(char, position)
    @char = char
    @position = position
  end
  attr_accessor :char, :position
end

class Pattern_match
  def pattern_match(contents)
    stack = []
    queue = []
    stack_index = []
    queue_index = []
    contents.each_char.with_index do |item ,i|
      if (item == "(" ) || (item == "{")
        stack.push(item)
        stack_index.push(i)
        #print "s #{stack}\n"
      elsif item == ")"
        if stack[-1] == "("
          print "#{stack_index[-1]}番目の \"#{stack[-1]}\" と#{i}番目の \"#{item}\" が対応しています\n"
          stack.pop
          #print "s #{stack}\n"
          stack_index.pop
        else
          queue.push(item)
          queue_index.push(i)
          #print "q #{queue}\n"
        end
      elsif item == "}"
        if stack[-1] == "{"
          print "#{stack_index[-1]}番目の \"#{stack[-1]}\" と#{i}番目の \"#{item}\" が対応しています\n"
          stack.pop
          #print "s #{stack}\n"
          stack_index.pop
        else
          queue.push(item)
          queue_index.push(i)
          #print "q #{queue}が\n"
        end
      end
    end
    stack.each_index do |i|
      print "#{stack_index[i]}番目の \"#{stack[i]}\" が閉じられていません\n"

    end
    queue.each_index do |i|
      print "#{queue_index[i]}番目の \"#{queue[i]}\" が開かれていません\n"
    end
  end
end

contents = open("sample.txt"){|f| f.read}
p contents = "{ab(cd)ef}gh)hi(jk{lm)no}pq}"
Pattern_match.new.pattern_match(contents)
