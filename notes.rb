# @instance_var
# @@class_var
# $glass_var
# :: is a constant lookup operator that looks up the Array constant only in the  module.

# module Perimeter
#   class Array
#     def initialize
#       @size = 400
#     end
#   end
# end

# our_array = Perimeter::Array.new
# ruby_array = Array.new

# p our_array.class
# p ruby_array.class

class Array
  def initialize
    @size = 400
  end
end

our_array = Array.new

p our_array.class