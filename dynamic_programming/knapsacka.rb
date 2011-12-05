# -*- coding: utf-8 -*-
class Product
  def initialize(size, value)
    @size = size
    @value = value
  end
  attr_accessor :size, :value
end

class Knapsacka

  def initialize(products)
    @products = products
    @results = []
  end
  attr_accessor :products, :results

  def solve(knapsacka_size)    
    (knapsacka_size + 1).times do |nap_size|
      hash = Hash.new(0)
      hash[@products.first] = nap_size / @products.first.size

      @results.push(hash)
    end

    @products[1..-1].each do |product|
      (knapsacka_size + 1).times do |nap_size|
        update_knapsacka(product, nap_size)
      end
    end
    @results[knapsacka_size]
  end
  
  def update_knapsacka(product, nap_size)
    if product.size <= nap_size
      new_value = total_value(nap_size - product.size)
      new_value += product.value
      old_value = total_value(nap_size)
      if new_value > old_value
        update_value(product, nap_size)
      end
    end
  end
  
  def total_value(nap_size)
    val = 0
    @results[nap_size].each do |product, number|
       val += product.value * number
    end
    val
  end
  
  def update_value(product, nap_size)
    @results[nap_size] = @results[nap_size-product.size].dup
    @results[nap_size][product] += 1 #@results[nap_size][product] + 1
  end
  
end


if $0 == __FILE__

  products = [
              Product.new(2, 2),
              Product.new(3, 4),
              Product.new(5, 7),
              Product.new(6, 10),
              Product.new(9, 14),
             ]
  knapsacka = Knapsacka.new(products)

  p knapsacka.solve(16)

end
