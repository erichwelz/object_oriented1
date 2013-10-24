class RegularProduct
  def initialize(name, price)
    @name = name
    @price = price
  end

  def total_price
    (@price + sales_tax)
  end

  def sales_tax
    int_tax = ((@price * tax_rate)*100).to_i 
      if int_tax % 5 == 0 # guard clause
        return (int_tax.to_f / 100) # rounds up to nearest .05
      else
        (int_tax.to_f / 100) + 0.05 - (int_tax.to_f / 100 % 0.05)
      end
  end

  def tax_rate
    0.10
  end

def output
  "1 #{@name} : #{sprintf("%.2f", total_price)}"
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
    @total_prices = 0
    @products.each do |product|
      @total_taxes += product.sales_tax
      @total_prices += product.total_price
      end

  end
  
  def print_totals
    puts "Sales Taxes: #{sprintf("%.2f", @total_taxes)}"
    puts "Total: #{sprintf("%.2f", @total_prices)}"
    puts
  end

  def print_receipt(*products)
    @products.each { |product| puts product.output }
    print_totals
  end
end

#input 1

product1 = Exempt.new("book", 12.49)
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
cart1.print_receipt

puts "Output2:"
cart2.print_receipt

puts "Output3:"
cart3.print_receipt
