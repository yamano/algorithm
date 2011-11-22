# -*- coding: utf-8 -*-
class String
  def simple_search(target)
    self.each_char.with_index do | item, index |
      if slice( index, target.size ) == target
        show_answer(index, target)
        return true
      end
    end
  show_error(target)
  false
  end

  def show_answer(index, target)
    puts "#{self}の#{index}番目に#{target}が見つかりました。"
  end

  def show_error(target)
    puts "#{self}の中に#{target}が見つかりませんでした。"
  end
end

if $0 == __FILE__
  'abcde'.simple_search('bc')
end
