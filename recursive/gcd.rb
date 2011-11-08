def gcd(a, b)
  min = [ a, b ].min

  max = nil
  (1..min).each do |i|
    if a % i == 0 and b % i == 0
      max = i
    end
  end
  max
end
