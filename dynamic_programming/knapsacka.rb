# -*- coding: utf-8 -*-
class Knapsacka

  KNAPSACKA_SIZE_MAX = 16

  def initialize(size, value)
    @size = size
    @value = value
    # knapsacka_valueは商品の個数とナップザックの対象サイズの二重配列に最高の価値を格納するもの。
    @knapsacka = []
    @knapsacka_combination = []
  end
  attr_accessor :size, :value, :knapsacka, :knapsacka_combination

  def calculation_value
    @value.length.times do |i|
      KNAPSACKA_SIZE_MAX.times do |j|
        if i == 0
          # ナップザックの対象サイズに1種類の商品がいくつふくまれているか計算し、そこから価値を計算
          @knapsacka[j] = (j + 1) / @size[i] * @value[i]
          @knapsacka_combination[j] = { @value[i] =>  (j + 1) / @size[i] }
        else
          # 商品の種類を増やしたときに最適解を更新する
          update_knapsacka(i, j)
        end
      end

    end
    @knapsacka_combination
  end

  def update_knapsacka(i, j)
    if j == @size[i] - 1
      new_value = @value[i]
      if new_value >  @knapsacka[j]
        @knapsacka[j] = new_value
        @knapsacka_combination[j].clear
        @knapsacka_combination[j][@value[i]] = 1
      end
    elsif j >= @size[i]
      tmp = Marshal.load(Marshal.dump(@knapsacka_combination))
      new_value = @knapsacka[j - @size[i]] + @value[i]
      if new_value >  @knapsacka[j]
        @knapsacka[j] = new_value
        @knapsacka_combination[j] = tmp[j - @size[i]]
        if @knapsacka_combination[j][@value[i]]
           @knapsacka_combination[j][@value[i]] += 1
        else
           @knapsacka_combination[j][@value[i]] = 1
        end
      end
    end
  end

end


if $0 == __FILE__
  size = [2, 3, 5, 6, 9]
  value = [2, 4, 7, 10, 14]

  ex = Knapsacka.new(size.map{|i| i}, value.map{|i| i})

  ex.calculation_value

end
