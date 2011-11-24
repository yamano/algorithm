# -*- coding: utf-8 -*-
class String
  def simple_search( target )
    count = 0
    self.size.times do | i |
      count += 1
      if slice( i, target.size ) == target
        show_answer( i, target, count )
        return true
      end
    end
  show_error( target )
  false
  end

  def make_slide_table( target, slide_table )
    left_char = 0
    right_char = 1
    while target.length > right_char
      if target[ right_char ] == target[ left_char ]
        right_char += 1
        left_char += 1
        slide_table[ right_char ] = left_char
      elsif left_char == 0
        right_char += 1
        slide_table[ right_char ] = 0
      else
        left_char = slide_table[ left_char ]
      end
    end
  end

  def kmp_search(target)
    slide_table = Array.new(target.length, 0)
    make_slide_table( target, slide_table )
    text_index = 0
    target_index = 0
    count = 0
    while text_index < self.length
      count += 1
      if self[ text_index ] == target[ target_index ]
        text_index += 1
        target_index += 1
        if target.length == target_index
          show_answer( text_index - target.length, target, count )
          return true
        end
      elsif target_index == 0
        text_index += 1
      else
        target_index = slide_table[ target_index ]
      end
    end
    show_error( target )
    false
  end

  def make_slide_hash( target, slide_hash )
    target.length.times do |i|
      slide_hash[ target[ i ] ] = target.length - i - 1
    end
  end
  
  def bm_search( target )
    slide_hash   = {}
    text_index   = target.length - 1
    make_slide_hash( target, slide_hash )
    count = 0

    while text_index < self.length
      target_index = target.length - 1
      count += 1
      
      while self[ text_index ] == target[ target_index ]
        if target_index == 0
          show_answer( text_index, target, count )
          return true
        end
        text_index   -= 1
        target_index -= 1
        count += 1
      end
      
      if slide_hash[ self[ text_index ] ]
        if slide_hash[ self[ text_index ] ] > target.length - target_index
          text_index += slide_hash[ self[ text_index ] ]
        else
          text_index += target.length - target_index
        end
      else
        text_index += target.length
      end

    end
    show_error( target )
    false
  end
  
  def show_answer( i, target, count )
    puts "#{self}の#{i + 1}番目に#{target}が見つかりました。探索回数は#{count}回です。"
  end

  def show_error( target )
    puts "#{self}の中に#{target}が見つかりませんでした。"
  end
end

if $0 == __FILE__
  'abcabcabcd'.kmp_search('abcabcd')
end
