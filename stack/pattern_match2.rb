# -*- coding: utf-8 -*-
class Pattern_match
  def pattern_match(contents)
    stack = []
    queue = []
    contents.each_char.with_index do |item ,i|
      if (item == "(" ) || (item == "{")
        stack.push( {item => i})
      elsif item == ")"
        if stack != [] && stack[-1].map{|char, position| char} == ["("]
          print "#{stack[-1].map{|char, position| position}}番目の #{stack[-1].map{|char, position| char}} と [#{i}] 番目の [\"#{item}\"] が対応しています\n"
          stack.pop
        else
          queue.push({item => i})
        end
      elsif item == "}"
        if stack != [] && stack[-1].map{|char, position| char} == ["{"]
          print "#{stack[-1].map{|char, position| position}}番目の #{stack[-1].map{|char, position| char}} と [#{i}] 番目の [\"#{item}\"] が対応しています\n"
          stack.pop
        else
          queue.push({item => i})
        end
      end
    end
    stack.size.times do |i|
        print "#{stack[i].map{|char, position| position}}番目の #{stack[i].map{|char, position| char}} が閉じられていません\n"
    end
    queue.size.times do |i|
        print "#{queue[i].map{|char, position| position}}番目の #{queue[i].map{|char, position| char}} が開かれていません\n"
    end
  end
end

contents = open("sample.txt"){|f| f.read}
p contents = "{ab(cd)ef}gh)hi(jk{lm)no}pq}"
Pattern_match.new.pattern_match(contents)
