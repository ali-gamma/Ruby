# Write a Ruby program to get a substring from a specified position to the last char of a given string.
puts "Enter the string"
a = gets.chop
puts "Enter the index"
x = gets.chop.to_i
puts a[x..-1]
=begin

Enter the string
asdfvcxz
Enter the index
3
fvcxz

=end
