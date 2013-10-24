

class RegularProduct
  def initialize(name, price)
    @name = name
    @price = price
  end

  def total_price
    @price + sales_tax
  end

  def sales_tax
    @price * tax_rate
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

puts "List1:"

product1 = Exempt.new("book", 12.49) #Questions to ask object is info we need to give it
product2 = RegularProduct.new("music CD", 14.99)
product3 = Exempt.new("chocolate bar", 0.85)

puts product1.total_price
puts product2.output



# puts product2.total_price
# puts product3.total_price

#puts product1.name

# puts "List2:"

# product2_1 = ImportedExempt.new("imported box of chocolates", 10.00)
# product2_2 = Imported.new("imported bottle of perfume", 47.50)

# puts product2_1.total_price
# puts product2_2.total_price

# puts "List3:"

# product3_1 = Imported.new("imported bottle of perfume", 27.99)
# product3_2 = RegularProduct.new("bottle of perfume", 18.99)
# product3_3 = Exempt.new("packet of headache pills", 9.75)
# product3_4 = ImportedExempt.new("imported box of chocolates", 11.25)

# puts product3_1.total_price
# puts product3_2.total_price
# puts product3_3.total_price
# puts product3_4.total_price
