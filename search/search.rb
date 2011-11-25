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
    repeat_index = 0
    target_index = 1
    while target[target_index + 1]
      if target[target_index] == target[repeat_index]
        target_index += 1
        repeat_index += 1
        slide_table[target_index] = repeat_index
      elsif repeat_index == 0
        target_index += 1
      else
        repeat_index = slide_table[repeat_index]
      end
    end
    slide_table
  end

  def kmp_search(target)
    slide_table = make_slide_table(target)
    position = 0
    target_index = 0
    index_array = []
    while self[position]
      if self[position] == target[target_index]
        position += 1
        target_index += 1
        if target.length == target_index
          index_array.push(position - target.length + 1)
          target_index = 0
        end
      elsif target_index == 0
        position += 1
      else
        target_index = slide_table[target_index]
      end
    end
    index_array == [] ? nil : index_array
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
    index_array = []
    while self[position]
      target_index = target.length - 1
      position_copy = position
      while self[position] == target[target_index]
        if target_index == 0
          index_array.push(position + 1)
          break
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
    index_array == [] ? nil : index_array
  end

end

if $0 == __FILE__
  'abcabcabcd'.kmp_search('abcabcd')
end
