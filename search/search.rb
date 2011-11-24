# -*- coding: utf-8 -*-
class String
  def simple_search(target)
    self.length.times do |i| 
      if slice(i, target.size) == target
        return i + 1
      end
    end
  nil
  end

  def make_slide_table(target)
    slide_table = Array.new(target.length, 0)
    left_char = 0
    right_char = 1
    while target.length > right_char
      if target[right_char] == target[left_char]
        right_char += 1
        left_char += 1
        slide_table[right_char] = left_char
      elsif left_char == 0
        right_char += 1
        slide_table[right_char] = 0
      else
        left_char = slide_table[left_char]
      end
    end
    slide_table
  end

  def kmp_search(target)
    slide_table = make_slide_table(target)
    position = 0
    target_index = 0
    while self[position]
      if self[position] == target[target_index]
        position += 1
        target_index += 1
        if target.length == target_index
          return position - target.length + 1
        end
      elsif target_index == 0
        position += 1
      else
        target_index = slide_table[target_index]
      end
    end
    nil
  end

  def make_slide_hash(target)
    slide_hash   = {}
    target.each_char.with_index do |item, index|
      slide_hash[item] = target.length - index - 1
    end
    slide_hash
  end
  
  def bm_search(target)
    position   = target.length - 1
    slide_hash = make_slide_hash(target)
    while self[position]
      target_index = target.length - 1
      position_copy = position
      while self[position] == target[target_index]
        if target_index == 0
          return position + 1
        end
        position   -= 1
        target_index -= 1
      end
      
      if slide_hash[ self[position]]
        if slide_hash[self[position]] > target.length - target_index
          position += slide_hash[ self[position]]
        else
          position = position_copy + 1
        end
      else
        position += target.length
      end
    end
    nil
  end

end

if $0 == __FILE__
  'abcabcabcd'.kmp_search('abcabcd')
end
