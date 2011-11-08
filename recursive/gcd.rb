# -*- coding: utf-8 -*-
def gcd(a, b, opts = {})
  raise ArgumentError, "args include zero" if a == 0 or b == 0

  start = opts[:start] || 2
  min = [ a.abs, b.abs ].min

  (start..min).each do |i|
    if a % i == 0 and b % i == 0
      return i * gcd(a / i, b / i, :start => i)
    end
  end
  1
end

def gcd_multi(*args)
  args = args.dup
  opts = args.last.is_a?(Hash) ? args.pop : {}

  if args.size >= 2
    gcd_multi(gcd(args.shift, args.shift), *args)
  else
    args.first
  end
end
