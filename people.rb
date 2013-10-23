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
instructor.greeting #Hi, my name is Chris.

student = Student.new
student.name = "Cristina"
student.greeting

instructor.teach
student.learn

# student.teach # teach is not a valid method of class student