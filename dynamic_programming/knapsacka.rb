class Knapsacka

  KNAPSACKA_SIZE_MAX = 16

  def initialize(size, value)
    @size = size
    @value = value
    @knapsacka_value = @value.length.times.map{Array.new(KNAPSACKA_SIZE_MAX)}
  end
  attr_accessor :size, :value, :knapsacka_value

  def pack
    @value.length.times do |i|
      KNAPSACKA_SIZE_MAX.times do |knapsacka_size|
        if i == 0
          knapsacka_value[i][knapsacka_size] = (knapsacka_size + 1) / @size[i] * @size[i]
        else
          new_value = knapsacka_value[i -1][knapsacka_size - @size[i]] + value[i]
          knapsacka_value[i][knapsacka_size] = update_value(new_value, knapsacka_value[i - 1][knapsacka_size])
        end
      end
    end
    knapsacka_value[@value.length - 1][KNAPSACKA_SIZE_MAX - 1]
  end

  def update_value(new_value, old_value)
    new_value > old_value ? new_value : old_value
  end

end


if $0 == __FILE__
  size = [2, 3, 5, 6, 9]
  value = [2, 4, 7, 10, 14]

  ex = Knapsacka.new(size.map{|i| i}, value.map{|i| i})

  ex.pack

end
