class Integer
  def count_num_of_one
    return 0 if self == 0
    
    value = self.abs
    (value / 10).count_num_of_one + ( value % 10 == 1 ? 1 : 0 )
  end
end
