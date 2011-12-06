class String

  def calculate_rpn
    stack = []
    while self != ""
      char = self.slice!(0, 1)
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

  def operate(char, stack)
    n1 = stack.pop
    n2 = stack.pop
    stack.push(n2.send(char, n1) )
  end

  def has_number?(char)
    if char.scan(/\d/) != []
      true
    else
      false
    end
  end

  def has_operator?(char)
    if char.scan(/["+", "-", "*", "\/"]/) != []
      true
    else
      false
    end
  end
  
end

#class List

#  def make_rpn
    
#  end

#end

if $0 == __FILE__

  str = "5831+/*"
  p str.calculate_rpn

end
