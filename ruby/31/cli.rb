require_relative 'heart-rate'

print "What is your resting heart rate? "
resting_heart_rate = gets.chomp.to_i

print "What is your age? "
age = gets.chomp.to_i

person1 = HeartRate.new(resting_heart_rate: resting_heart_rate, age: age)
person1.pretty_print
