# -*- coding: utf-8 -*-
class String
  def simple_search(target)
    self.size.times do | i |
      if slice( i, target.size ) == target
        show_answer(i, target)
        return true
      end
    end
  show_error(target)
  false
  end

  def show_answer(i, target)
    puts "#{self}の#{i + 1}番目に#{target}が見つかりました。"
  end

  def show_error(target)
    puts "#{self}の中に#{target}が見つかりませんでした。"
  end
end

if $0 == __FILE__
  'abcde'.simple_search('bc')
end
