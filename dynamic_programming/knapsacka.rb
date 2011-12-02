# -*- coding: utf-8 -*-
class Knapsacka

  KNAPSACKA_SIZE_MAX = 16

  def initialize(size, value)
    @size = size
    @value = value
    # knapsackaは商品のサイズと個数のハッシュを配列として格納するもの。
    @knapsacka = []
  end
  attr_accessor :size, :value, :knapsacka

  def solve
    @value.length.times do |i|
      KNAPSACKA_SIZE_MAX.times do |j|
        if i == 0
          # ナップザックの対象サイズに1種類の商品がいくつふくまれているか計算
          @knapsacka[j] = { @value[i] =>  (j + 1) / @size[i] }
        else
          # 商品の種類を増やしたときに最適解を更新する
          update_knapsacka(i, j)
        end
      end
    end
    @knapsacka
  end

  def update_knapsacka(i, j)
    if j == @size[i] - 1
      new_value = @value[i]
      old_value = calculation_value(j)
      update_value(new_value, old_value, i, j)
    elsif j >= @size[i]
      new_value = calculation_value(j - @size[i])
      new_value += @value[i]
      old_value = calculation_value(j)
      update_value(new_value, old_value, i, j)
    end
  end

  def calculation_value(j)
    val = 0
    @knapsacka[j].each_pair do |key, value|
      val += key * value
    end
    val
  end

  def update_value(new_value, old_value, i, j)
    if new_value >  old_value
      if j == @size[i] - 1
        @knapsacka[j].clear
      else
        tmp = Marshal.load(Marshal.dump(@knapsacka))    
        @knapsacka[j] = tmp[j - @size[i]]
      end
      if @knapsacka[j][@value[i]]
        @knapsacka[j][@value[i]] += 1
      else
        @knapsacka[j][@value[i]] = 1
      end
    end
  end

end


if $0 == __FILE__
  size = [2, 3, 5, 6, 9]
  value = [2, 4, 7, 10, 14]

  ex = Knapsacka.new(size.map{|i| i}, value.map{|i| i})

  ex.solve

end
