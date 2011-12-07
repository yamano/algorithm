# -*- coding: utf-8 -*-
class String

  def calculate_rpn
    stack = []
    # 文字列を配列に変換
    string_array = split("")
    
    string_array.each do |char|
      if has_number?(char)
        stack.push(char.to_f)
      elsif has_operator?(char)
        operate(char, stack)
      else
        raise
      end
    end
    stack[0]  
  end

  def operate(operator, stack)
    n1 = stack.pop
    n2 = stack.pop
    stack.push(n2.send(operator, n1) )
  end

  def has_number?(char)
    if char.scan(/\d/) != []
      true
    else
      false
    end
  end

  def has_operator?(char)
    if char.scan(/["+", "\-", "*", "\/"]/) != []
      true
    else
      false
    end
  end

  def make_rpn_string_array
    
    # 文字列が4つの場合しか想定していないため、それ以外の場合はエラーを返す
    raise if self.size !=4

    # 文字列を配列に変換し、その順列のパターンを全てnumber_pattern_arrayに格納
    number_pattern_array = split("").permutation.to_a
    operator = ["+", "\-", "*", "\/"]
    # operatorの重複ありの組み合わせを全てoperator_pattern_arrayに格納
    operator_pattern_array = operator.product(operator, operator)
    rpn_pattern_array = []

    number_pattern_array.each do |number_pattern|
      operator_pattern_array.each do |operator_pattern|
        # 4つの数字から作れる逆ポーランド記法のパターンを作成
        rpn_pattern_array.push(number_pattern + operator_pattern)
        rpn_pattern_array.push(number_pattern[0, 3] + operator_pattern[0, 2] + number_pattern[3, 1] + operator_pattern[2, 1])
        rpn_pattern_array.push(number_pattern[0, 2] + operator_pattern[0, 1] + number_pattern[2, 2] + operator_pattern[1, 2])
        rpn_pattern_array.push(number_pattern[0, 2] + operator_pattern[0, 1] + number_pattern[2, 1] + operator_pattern[1, 1] + number_pattern[3, 1] + operator_pattern[2, 1])
      end
    end
    
    rpn_string_array = []
    # 配列を文字列に変換
    rpn_pattern_array.each_index do |i|
      rpn_string_array.push(rpn_pattern_array[i].join(""))
    end

    rpn_string_array
    
  end

  def solve_puzzle(target)

    rpn_pattern_array = make_rpn_string_array
    results = []
    
    rpn_pattern_array.each do |rpn_pattern|
      if rpn_pattern.calculate_rpn == target
        results.push(rpn_pattern)
      end
    end
    results
  end

end

if $0 == __FILE__

  str = "5831+/*"
  str1 = "1234"
  str2 = "5831"

#  str.split("")
#  p str.calculate_rpn
   str1.make_rpn_string_array.uniq.size
#  p str1.make_rpn_pattern_array.size
#  p str1.make_rpn_pattern_array.uniq.size
   p str1.solve_puzzle(10)
  
end
