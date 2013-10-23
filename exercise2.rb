# TODO

# Sales tax rates:
# Regular goods - 10% 
# books, food, medical products - 0%

# Import
# Regular goods - 15 &
# books, food, medical products - 5%

# Rounding > later

# Of note: import tax is calculated on base value, it's not a tax on tax.
# example item test = {:book => { price: 12.49, sales_tax: false, import_tax: false}}


list1 = {:book => { price: 12.49, sales_tax: false, import_tax: false},
:music_cd => { price: 14.99, sales_tax: true, import_tax: false},
:chocolate_bar => { price: 0.85, sales_tax: false, import_tax: false}}

# def calc()
#   final_price = list1
