def gcd(a, b)
  raise ArgumentError, "args include zero" if a == 0 or b == 0

  min = [ a.abs, b.abs ].min

  max = nil
  (1..min).each do |i|
    if a % i == 0 and b % i == 0
      max = i
    end
  end
  max
end
