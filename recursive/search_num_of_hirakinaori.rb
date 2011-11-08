def search_num_of_hirakinaori(*args)
  args_copy = args.dup
  target = 0
  args_copy.size.times do |i|
    temp = args_copy.shift
    target += temp ** temp
  end

  p args2 = args.dup
  target_copy = target
  args2.size.times do
    answer = target_copy % 10
    target_copy /= 10
    args2.size.times do |i|
      if answer == args2[i]
        args2[i] = nil
        args2.compact!
        break
      end
    end
  end
  #p args2
  return nil if args2 != []
  target
end

