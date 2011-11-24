# -*- coding: utf-8 -*-
class String
  def simple_search(target)
    count = 0
    self.size.times do | i |
      count += 1
      if slice( i, target.size ) == target
        show_answer(i, target, count)
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
        target_index = slide_table[target_index]
      end
    end
  end

  def kmp_search(target)
    slide_table = Array.new(target.length)
    make_slide_table(target, slide_table)
    i = 0
    j = 0
    count = 0
    while i < self.length
      count += 1
      if self[ i ] == target[ j ]
        i += 1
        j += 1
        if target.length == j
          show_answer(i - target.length, target, count)
          return true
        end
      elsif j==0
        i += 1
      else
        j = slide_table[j]
      end
    end
    show_error(target)
    false
  end

  def make_slide_hash(target, slide_hash)
    target.length.times do |i|
      slide_hash[target[i]] = target.length - i - 1
    end
  end
  
  def bm_search(target)
    slide_hash   = {}
    text_index   = target.length - 1
    make_slide_hash(target, slide_hash)
    count = 0

    while text_index < self.length
      target_index = target.length - 1
      count += 1
      
      while self[text_index] == target[target_index]
        if target_index == 0
          show_answer(text_index, target, count)
          return true
        end
        text_index   -= 1
        target_index -= 1
        count += 1
      end
      
      if slide_hash[self[text_index]]
        #p "s",slide_hash[self[text_index]]
        #p "t",target.length - target_index
        if slide_hash[self[text_index]] > target.length - target_index
          text_index += slide_hash[self[text_index]]
        else
          text_index += target.length - target_index
        end
      else
        text_index += target.length
      end

    end
    show_error(target)
    false
  end
  
  def show_answer(i, target, count)
    puts "#{self}の#{i + 1}番目に#{target}が見つかりました。探索回数は#{count}回です。"
  end

  def show_error(target)
    puts "#{self}の中に#{target}が見つかりませんでした。"
  end
end

if $0 == __FILE__
  'abcabcabcd'.kmp_search('abcabcd')
end
