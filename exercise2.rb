class RegularProduct
  def initialize(name, price)
    @name = name
    @price = price
  end

  def total_price
    (@price + sales_tax).round(2)
  end

  def sales_tax
    int_tax = ((@price * tax_rate)*100).to_i
    #(@price * tax_rate)
      if int_tax % 5 == 0
        return (int_tax.to_f / 100)
      else
        (int_tax.to_f / 100) + 0.05 - (int_tax.to_f / 100 % 0.05)
      # return price if price % 5 == 0 # guard clause, if satisfied, not need to run any other code
      # price + 5 - (price % 5) # only rounds up to nearest .05
      end
  end

  def tax_rate
    0.10
  end

def output
  "1 #{@name} : #{total_price}"
  end
end

class Exempt < RegularProduct
  def tax_rate
    0
  end
end

class Imported < RegularProduct
  def tax_rate
    super + 0.05 #runs parent's method of same name
  end
end

class ImportedExempt < Exempt
  def tax_rate
  super + 0.05
  end
end

class Cart
  def initialize(*products)
    @products = products
    @total_taxes = 0
    @total_price = 0
    @products.each do |product|
      @total_taxes += product.sales_tax
      @total_price += product.total_price
    end
    # puts total_taxes
    # puts total_price
  end
  def print_total
    puts "Sales Taxes: #{@total_taxes.round(2)}"
    puts "Total : #{@total_price.round(2)}"
    puts
  end

end


#input 1

product1 = Exempt.new("book", 12.49) #Questions to ask object is info we need to give it
product2 = RegularProduct.new("music CD", 14.99)
product3 = Exempt.new("chocolate bar", 0.85)

cart1 = Cart.new(product1, product2, product3)

# input 2

product2_1 = ImportedExempt.new("imported box of chocolates", 10.00)
product2_2 = Imported.new("imported bottle of perfume", 47.50)

cart2 = Cart.new(product2_1, product2_2)

# Input 3

product3_1 = Imported.new("imported bottle of perfume", 27.99)
product3_2 = RegularProduct.new("bottle of perfume", 18.99)
product3_3 = Exempt.new("packet of headache pills", 9.75)
product3_4 = ImportedExempt.new("imported box of chocolates", 11.25)

cart3 = Cart.new(product3_1, product3_2, product3_3, product3_4)

puts "Output1:"

puts product1.output
puts product2.output
puts product3.output
cart1.print_total

puts "Output2:"

puts product2_1.output
puts product2_2.output
cart2.print_total

puts "Output3:"

puts product3_1.output
puts product3_2.output
puts product3_3.output
puts product3_4.output
cart3.print_total