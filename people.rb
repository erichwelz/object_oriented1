class Person
      attr_accessor :name
    def greeting()
      puts "Hi, my name is #{@name}."
    end
end

class Student < Person
  def learn()
    puts "I get it"
  end
end

class Instructor < Person
  def teach()
    puts "Everything in Ruby is an Object"
  end
end

instructor = Instructor.new
instructor.name = "Chris"
instructor.greeting #Hi, my name is name


# person.name.greeting

# puts Student.new.learn
# Chris = instructor.new
# Chris.name = "Chris"
# puts Chris.greeting