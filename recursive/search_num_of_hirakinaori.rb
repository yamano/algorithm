def search_num_of_hirakinaori(*args)
  args_copy = args.dup
  target = 0
  args_copy.size.times do |i|
    temp = args_copy.shift
    next if temp == 0
    target += temp ** temp
  end

  args_copy = args.dup
  target_copy = target
  args.size.times do
    answer = target_copy % 10
    target_copy /= 10
    args.size.times do |i|
      if answer == args_copy[i]
        args_copy[i] = nil
        args_copy.compact!
        break
      end
    end
  end
  return nil if args_copy != []
  p args
  p target
end

def make_numbers
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
                      search_num_of_hirakinaori(*[i, j, k, l, m, n, o, p, q, r])
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
end
=begin
def new_make_numbers(start, kosuu, array)
  return if kosuu > 10
  (start..9).each do |i|
    array[i] += 1
    search_num_of_hirakinaori(*array)
    new_make_numbers(i, kosuu + 1, array)
    array[i] -= 1
  end
end
  
a = [0,0,0,0,0,0,0,0,0,0]
new_make_numbers(1, 1, a)
=end

make_numbers
