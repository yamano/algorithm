# -*- coding: utf-8 -*-
class Knapsacka

  KNAPSACKA_SIZE_MAX = 16

  def initialize(size, value)
    @size = size
    @value = value
    # knapsacka_valueは商品の個数とナップザックの対象サイズの二重配列に最高の価値を格納するもの。
    @knapsacka = Array.new(KNAPSACKA_SIZE_MAX)
  end
  attr_accessor :size, :value, :knapsacka

  def calculation_value
    @value.length.times do |i|
      KNAPSACKA_SIZE_MAX.times do |j|
        if i == 0
          # ナップザックの対象サイズに1種類の商品がいくつふくまれているか計算し、そこから価値を計算
          @knapsacka[j] = (j + 1) / @size[i] * @value[i]
        else
          # 商品の種類を増やしたときに最適解を更新する
          update_knapsacka(i, j)
        end
      end
    end
    @knapsacka[KNAPSACKA_SIZE_MAX - 1]
  end

  def update_knapsacka(i, j)
    if j == @size[i] - 1
      new_value = @value[i]
    elsif j >= @size[i]
      # 
      new_value = @knapsacka[j - @size[i]] + @value[i]
    else
      new_value = 0
    end
    # 商品を増やす前と増やした後で価値の大きい方を最適解として代入
    @knapsacka[j] = new_value >  @knapsacka[j] ? new_value : @knapsacka[j]
  end

end


if $0 == __FILE__
  size = [2, 3, 5, 6, 9]
  value = [2, 4, 7, 10, 14]

  ex = Knapsacka.new(size.map{|i| i}, value.map{|i| i})

  p ex.calculation_value

  p ex.knapsacka_value


end
