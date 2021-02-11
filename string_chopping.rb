# Write a Ruby program to get a substring from a specified position to the last char of a given string.

puts "Enter the string"
string_1 = gets.chop
puts "Enter the index"
pos = gets.chop.to_i
puts string_1[pos..-1]

=begin

Enter the string
asdfvcxz
Enter the index
3
fvcxz

=end
