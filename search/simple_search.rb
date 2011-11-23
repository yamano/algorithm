# -*- coding: utf-8 -*-
class String
  def simple_search(target)
    count = 0
    self.size.times do | i |
      count += 1
      if slice( i, target.size ) == target
        show_answer_simple(i, target)
        return true
      end
    end
  show_error(target)
  false
  end

  def make_slide_table(target, slide_table)
    text_index = 1
    target_index = 0
    while target.length > text_index
      if target[text_index] == target[target_index]
        text_index += 1
        target_index += 1
        slide_table[text_index] = target_index
      elsif target_index == 0
        text_index += 1
        slide_table[text_index] = 0
      else
        p target_index = slide_table[target_index]
      end
    end
  end

  def kmp_search(target)
    slide_table = Array.new(target.length)
    make_slide_table(target, slide_table)
    p slide_table
    i = 0
    j = 0
    count = 0
    while i < self.length
      count += 1
      if self[ i ] == target[ j ]
        i += 1
        j += 1
        if target.length == j
          show_answer(i, target, count)
          return true
        end
      elsif j==0
        i += 1
      else
        p j, slide_table[j]
        j = slide_table[j]
      end
    end
    show_error(target)
    false
  end
  
  def show_answer_simple(i, target)
    puts "#{self}の#{i + 1}番目に#{target}が見つかりました。"
  end

  def show_answer(i, target, count)
    puts "#{self}の#{i + 1 - target.length}番目に#{target}が見つかりました。探索回数は#{count}回です。"
  end

  def show_error(target)
    puts "#{self}の中に#{target}が見つかりませんでした。"
  end
end

if $0 == __FILE__
  'abcabcabcd'.kmp_search('abcabcd')
end
