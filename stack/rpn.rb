# -*- coding: utf-8 -*-
class PuzzleSolver

  def solve_puzzle(rpn, target)
    results = make_rpn_pattern_array(rpn.array).select{ |rpn_pattern| rpn.calculate_rpn(rpn_pattern) == target }
  end

  def make_rpn_pattern_array(array)
    # 配列が4つの場合しか想定していないため、それ以外の場合はエラーを返す
    raise if array.size !=4
    # 配列の順列のパターンを全てnumber_pattern_arrayに格納
    number_pattern_array = array.permutation.to_a
    operator = ["+", "-", "*", "\/"]
    # operatorの重複ありの組み合わせを全てoperator_pattern_arrayに格納
    operator_pattern_array = operator.product(operator, operator)
    rpn_pattern_array = []

    number_pattern_array.each do |number_pattern|
      operator_pattern_array.each do |operator_pattern|
        # 4つの数字から作れるパターンを作成
        rpn_pattern_array.push(number_pattern + operator_pattern)
        rpn_pattern_array.push(number_pattern[0, 3] + operator_pattern[0, 2] + number_pattern[3, 1] + operator_pattern[2, 1])
        rpn_pattern_array.push(number_pattern[0, 2] + operator_pattern[0, 1] + number_pattern[2, 2] + operator_pattern[1, 2])
        rpn_pattern_array.push(number_pattern[0, 2] + operator_pattern[0, 1] + number_pattern[2, 1] + operator_pattern[1, 1] + number_pattern[3, 1] + operator_pattern[2, 1])
      end
    end
    
    rpn_pattern_array
    
  end

end

class Rpn

  def initialize(array)
    @array = array
  end
  attr_accessor :array

  def calculate_rpn(rpn_pattern)
    stack = []
    
    rpn_pattern.each do |item|
      if item.kind_of? Integer
        stack.push(item.to_f)
      elsif item.scan(/[+\-*\/]/) != []
        operate(item, stack)
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

end

if $0 == __FILE__

  rpn = Rpn.new([5, 8, 3, 1, "+", "/", "*"])
  rpn1 = Rpn.new([1, 2, 3, 4])
  rpn2 = Rpn.new([5, 8, 3, 1])

  solver = PuzzleSolver.new

#  str.split("")
#  p str.calculate_rpn
   solver.make_rpn_pattern_array(rpn1.array).uniq.size
#  p str1.make_rpn_pattern_array.size
#  p str1.make_rpn_pattern_array.uniq.size
   solver.solve_puzzle(rpn2, 10)
  
end
