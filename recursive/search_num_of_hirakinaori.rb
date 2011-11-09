def calc_hirakinaori(args)
  args.inject(0) do |sum, item|
    sum + ( item == 0 ?  0 : item ** item )
  end
end

def match_numbers?(target, args)
  expected_array = target.to_s.scan(/(.)/).flatten.map(&:to_i).select {|i| i != 0 }.sort
  actual_array   = args.select {|i| i != 0 }.sort

  actual_array == expected_array
end

def search_num_of_hirakinaori(args)
  target = calc_hirakinaori(args)
  if match_numbers?(target, args)
    target
  else
    nil
  end
end

def make_numbers
  args = []
  (0..9).each do |i|
    (i..9).each do |j|
      (j..9).each do |k|
        (k..9).each do |l|
          (l..9).each do |m|
            (m..9).each do |n|
              (n..9).each do |o|
                (o..9).each do |p|
                  (p..9).each do |q|
                    (q..9).each do |r|
                      args.push([i, j, k, l, m, n, o, p, q, r])
                      end
                    end
                  end
              end
            end
          end
        end
      end
    end
  end
  return args
end

if $0 == __FILE__
  args = make_numbers
  
  args.each do |item|
    if num = search_num_of_hirakinaori(item)
      puts num
    end
  end
end
